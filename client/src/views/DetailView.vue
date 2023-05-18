<script>
import MainInput from '../components/atoms/MainInput.vue'
import RadioButton from '../components/atoms/RadioButton.vue'
import Sidebar from '../components/organism/Sidebar.vue'
import MainButton from '../components/atoms/MainButton.vue'

import { useDataStore } from '../stores/counter'
import { mapActions, mapState, mapWritableState } from 'pinia'

export default {
  components: {
    Sidebar,
    MainInput,
    RadioButton,
    MainButton
  },
  
  data() {
    return {
      isPopUpEdit: false,
      isPopUpDelete: false,
      isChange:false,
      data: {
        name: "",
        sex: "",
        religion:"",
        phone:"",
        address:"",
        nik:"",
        image_url:""
      }
    }
  },

  computed: {
    ...mapWritableState(useDataStore, ['patient'])
  },
 
  watch: {
  patient(newPatient) {  
    this.data = { ...newPatient.result }; // membuat salinan dari newPatient.result ke data
  }
},

  
  methods: {
    ...mapActions(useDataStore, ['getPatientById', 'deletePatientById', 'editPatient']),

    async handleEditPatient() {
      await this.editPatient(this.$route.params.id, this.data)
      this.getPatientById(this.$route.params.id)
      this.isPopUpEdit = false
    },

    async handleDelete() {
      await this.deletePatientById(this.$route.params.id)
      this.$router.push('/')
    },
    
    toggleEdit() {
      this.isPopUpEdit = !this.isPopUpEdit;
    },
    
    toggleDelete() {
      this.isPopUpDelete = !this.isPopUpDelete;
    }
    
  },

  async mounted() {
    await this.getPatientById(this.$route.params.id)
    this.isChange  = true
  }
  
}
</script>

<template>
  <div v-if="!Object.keys(patient).length">Loading</div>

  <div v-else-if="Object.keys(patient).length && isChange" class="h-full  grid items-center">
    <div
      class="w-full bg-white border pb-5 border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700"
    >
      <div class="flex justify-end px-4 pt-4">
        <button
          id="dropdownButton"
          data-dropdown-toggle="dropdown"
          class="inline-block text-gray-500 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-700 focus:ring-4 focus:outline-none focus:ring-gray-200 dark:focus:ring-gray-700 rounded-lg text-sm p-1.5"
          type="button"
        >
          <span class="sr-only">Open dropdown</span>
          <svg
            class="w-6 h-6"
            aria-hidden="true"
            fill="currentColor"
            viewBox="0 0 20 20"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              d="M6 10a2 2 0 11-4 0 2 2 0 014 0zM12 10a2 2 0 11-4 0 2 2 0 014 0zM16 12a2 2 0 100-4 2 2 0 000 4z"
            ></path>
          </svg>
        </button>
        <!-- Dropdown menu -->
        <div
          id="dropdown"
          class="z-10 hidden text-base list-none bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700"
        >
          <ul class="py-2" aria-labelledby="dropdownButton">
            <li>
              <a
                href="#"
                class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white"
                >Edit</a
              >
            </li>
            <li>
              <a
                href="#"
                class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white"
                >Export Data</a
              >
            </li>
            <li>
              <a
                href="#"
                class="block px-4 py-2 text-sm text-red-600 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white"
                >Delete</a
              >
            </li>
          </ul>
        </div>
      </div>
      <div class="md:flex  justify-around items-center p-5">
        <div class=" border-black w-52 h-52">
          <img
            class="mb-3 w-full rounded-full shadow-lg"
            :src="patient.result.image_url"
            alt="Bonnie image"
          />
        </div>

        <div>
          <h5 class="mb-5 text-4xl font-bold text-gray-900 dark:text-white">
            {{ patient.result.name }}
          </h5>

          <div class="flex gap-5">
            <div>
              <p class="text-sm font-semibold text-gray-900 dark:text-gray-400">Gender</p>
              <p class="mb-1 text-sm text-gray-900 dark:text-white">{{ patient.result.sex }}</p>
            </div>
            <div>
              <p class="text-sm font-semibold text-gray-900 dark:text-gray-400">Religion</p>
              <p class="mb-1 text-sm text-gray-900 dark:text-white">
                {{ patient.result.religion }}
              </p>
            </div>
            <div>
              <p class="text-sm font-semibold text-gray-900 dark:text-gray-400">Phone</p>
              <p class="mb-1 text-sm text-gray-900 dark:text-white">{{ patient.result.phone }}</p>
            </div>
            <div>
              <p class="text-sm font-semibold text-gray-900 dark:text-gray-400">Address</p>
              <p class="mb-1 text-sm text-gray-900 dark:text-white">{{ patient.result.address }}</p>
            </div>
            <div>
              <p class="text-sm font-semibold text-gray-900 dark:text-gray-400">NIK</p>
              <p class="mb-1 text-sm text-gray-900 dark:text-white">{{ patient.result.nik }}</p>
            </div>
          </div>

          <div class="flex gap-3 mt-5  justify-end">
            <MainButton @click="toggleEdit" label="Edit" tailwind="bg-gray-600 w-24" />
            <MainButton @click="toggleDelete" label="Delete" tailwind="bg-red-500 w-24" />
          </div>
        </div>

        <!-- <div class="flex mt-4 space-x-3 md:mt-6">
            <a href="#" class="inline-flex items-center px-4 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Add friend</a>
            <a href="#" class="inline-flex items-center px-4 py-2 text-sm font-medium text-center text-gray-900 bg-white border border-gray-300 rounded-lg hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-gray-200 dark:bg-gray-800 dark:text-white dark:border-gray-600 dark:hover:bg-gray-700 dark:hover:border-gray-700 dark:focus:ring-gray-700">Message</a>
        </div> -->
      </div>
    </div> 
     
  </div>
  
   

    <!-- Main modal -->
    <div
        v-if="isPopUpEdit"
        id="authentication-modal"
        tabindex="-1"
        aria-hidden="true"
        style="background-color:rgba(0, 0, 0, 0.49);"
        class="fixed border-4 backdrop-filter backdrop-blur-sm border-black top-0 flex justify-center items-center left-0 right-0 z-50 w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-[100vh] max-h-full"
      >
        <div class="relative w-full max-w-md max-h-full">
          <!-- Modal content -->
          <div class="relative h-[90vh] overflow-y-scroll bg-white rounded-lg shadow dark:bg-gray-800">
            <button
              @click="toggleEdit"
              type="button"
              class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white"
              data-modal-hide="authentication-modal"
            >
              <svg
                aria-hidden="true"
                class="w-5 h-5"
                fill="currentColor"
                viewBox="0 0 20 20"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  fill-rule="evenodd"
                  d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                  clip-rule="evenodd"
                ></path>
              </svg>
              <span class="sr-only">Close modal</span>
            </button>
            <div class="px-6 py-6 lg:px-8">
              <h3 class="mb-4 text-xl font-medium text-gray-900 dark:text-white">Edit</h3>
              <form class="space-y-6" @submit.prevent="handleEditPatient" >
                <MainInput
                  :value="data.name"
                  type="text"
                  label1="Name"
                  placeholder="E.g John Doe"
                  @onchange="data.name = $event"
                />

                <h1 class="text-sm font-semibold text-gray-900 dark:text-white">Gender</h1>
                <div class="flex gap-5">
                  <RadioButton
                    :checked="data.sex === 'Male'"
                    name="sex"
                    value="Male"
                    label1="Male"
                    @onchange="data.sex = $event"
                  />
                  <RadioButton
                    :checked="data.sex === 'Female'"
                    name="sex"
                    value="Female"
                    label1="Female"
                    @onchange="data.sex = $event"
                  />
                </div>
                <MainInput
                  :value="data.religion"
                  type="text"
                  label1="Religion"
                  placeholder="E.g Islam"
                  @onchange="data.religion = $event"
                />

                <MainInput
                  :value="data.phone"
                  type="text"
                  label1="Phone Number"
                  placeholder="E.g 0808...."
                  @onchange="data.phone = $event"
                />

                <MainInput
                  :value="data.address"
                  type="text"
                  label1="Address"
                  placeholder="E.g Mawar street"
                  @onchange="data.address = $event"
                />

                <MainInput
                  :value="data.nik"
                  type="number"
                  label1="NIk"
                  placeholder="E.g 147...."
                  @onchange="data.nik = $event"
                />
                
                <MainInput
                  :value="data.image_url"
                  type="text"
                  label1="Image Url"
                  placeholder="E.g https://...."
                  @onchange="data.image_url = $event"
                />

                <MainButton type="submit" label="Submit" tailwind="bg-blue-600" />
              </form>
            </div>
          </div>
        </div>
      </div>
  
  <div v-if="isPopUpDelete" id="popup-modal" tabindex="-1" style="background-color:rgba(0, 0, 0, 0.49);" class="fixed  border-black top-0 left-0 backdrop-filter backdrop-blur-sm right-0 z-50 grid justify-center items-center  p-4 overflow-x-hidden overflow-y-auto md:inset-0  h-[100vh]">
      <div class="relative w-full max-w-md max-h-full">
          <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
              <button @click="toggleDelete" type="button" class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white" data-modal-hide="popup-modal">
                  <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                  <span class="sr-only">Close modal</span>
              </button>
              <div class="p-6 text-center">
                  <svg aria-hidden="true" class="mx-auto mb-4 text-gray-400 w-14 h-14 dark:text-gray-200" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                  <h3 class="mb-5 text-lg font-normal text-gray-500 dark:text-gray-400">Are you sure you want to delete this data?</h3>
                  <button @click="handleDelete" data-modal-hide="popup-modal" type="button" class="text-white bg-red-600 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 dark:focus:ring-red-800 font-medium rounded-lg text-sm inline-flex items-center px-5 py-2.5 text-center mr-2">
                      Yes, I'm sure
                  </button>
                  <button @click="toggleDelete" data-modal-hide="popup-modal" type="button" class="text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-gray-200 rounded-lg border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10 dark:bg-gray-700 dark:text-gray-300 dark:border-gray-500 dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-gray-600">No, cancel</button>
              </div>
          </div>
      </div>
  </div>

  
  
</template>
