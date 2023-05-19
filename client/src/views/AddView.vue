<script>
import MainInput from '../components/atoms/MainInput.vue';
import RadioButton from '../components/atoms/RadioButton.vue';
import Sidebar from '../components/organism/Sidebar.vue';
import MainButton from '../components/atoms/MainButton.vue'


import { useDataStore } from "../stores/counter";
import { mapActions, mapState } from 'pinia';
 
export default {
  components: {
    Sidebar,
    MainInput,
    RadioButton,
    MainButton
  },
  data() {
    return {
      patient: {
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
  
  methods: {
    ...mapActions(useDataStore, ["addPatient"]),
    async handleAddPatient() {
      await this.addPatient(this.patient)
    }
  },
    
}

</script>

<template>
  
  <section class="">
  <div class="py-8 px-4 mx-auto max-w-2xl lg:py-16">
      <h2 class="mb-4 text-xl font-bold text-gray-900 dark:text-white">Add a new patient</h2>
      <form @submit.prevent="handleAddPatient" >
          <div class="grid gap-4 sm:grid-cols-2 sm:gap-6">
              <div class="sm:col-span-2">
                <MainInput  
                  type="text" 
                  label1="Name" 
                  placeholder="E.g John Doe"
                  @onchange="patient.name = $event"
                /> 
              </div>
              <div>
                <h1 class="text-sm font-semibold text-gray-900 dark:text-white">Gender</h1>
                <div class="flex gap-5 mt-2">
                  <RadioButton 
                  name="sex" 
                  value="Male" 
                  label1="Male" 
                  @onchange="patient.sex = $event" 
                  />
                  <RadioButton 
                  name="sex" 
                  value="Female" 
                  label1="Female" 
                  @onchange="patient.sex = $event"
                  /> 
                </div> 
              </div> 
              <div class="w-full">
                <MainInput 
                  type="text" 
                  label1="Phone Number" 
                  placeholder="E.g 0808...."
                  @onchange="patient.phone = $event"
                />
              </div>
              <div>
                <MainInput 
                  type="text" 
                  label1="Address" 
                  placeholder="E.g Mawar street"
                  @onchange="patient.address = $event"
                />
              </div>
              <div>
                <MainInput 
                  type="number" 
                  label1="NIK" 
                  placeholder="E.g 147...."
                  @onchange="patient.nik = $event"
                />
              </div> 
              <div class="w-full"> 
                <MainInput 
                  type="text" 
                  label1="Religion" 
                  placeholder="E.g Islam"
                  @onchange="patient.religion = $event"
                />
              </div>
              <div>
                <MainInput 
                  type="url" 
                  label1="Image Url" 
                  placeholder="E.g https://...."
                  @onchange="patient.image_url = $event"
                />
              </div>
          </div>
          <MainButton type="submit" label="Add patient" tailwind="bg-blue-500 w-32 mt-4 " /> 
      </form>
  </div>
</section>
  
  
</template>




<!-- <form @submit.prevent="handleAddPatient" >
  
 
  
    
 
    
  
    
  
  
  <button type="submit" >aubmit</button>
  
</form> -->