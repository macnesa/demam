<template>
  <h1 class="text-2xl mt-5 font-bold text-gray-900 dark:text-gray-500">Patient List</h1>  
   
  <section id="container" class=" hidden  flex-wrap gap-4 mt-20">
    <div 
      v-for="each in patients.result"
      @click="$router.push('/' + each.id)"
      :key="each.id"
      class="flex cursor-pointer justify-between items-center w-full max-w-xs h-20 p-4 text-gray-500 bg-white rounded-lg shadow dark:text-gray-400 dark:bg-gray-800 border dark:border-gray-600 dark:hover:border-gray-500"
      role="alert"
    >
     
      <h1 class="text-sm font-medium text-gray-900 dark:text-white">{{ each.name }}</h1>
      
      <div class=" border-black w-10 h-10">
          <img
            class="mb-3 w-full rounded-full shadow-lg"
            :src="each.image_url" 
          />
        </div> 
    </div>
  </section>
</template>

<script>
import ScrollReveal from 'scrollreveal'; 
import { useDataStore } from "../stores/counter";
import { mapState } from 'pinia';
import Dropzone from '../components/atoms/Dropzone.vue';

export default {
  components:{
    Dropzone
  },
  
  data() {
    return {
      isPatientsDataLoaded: false,
      lalala:false,
    };
  },
  
  computed: {
    ...mapState(useDataStore, ["patients"]),
  },

  mounted() {
    this.isPatientsDataLoaded = true;
  },
  
  updated() {
    if (this.isPatientsDataLoaded) { 
      this.animateScrollReveal();
    }
  },
  
  methods: {
    animateScrollReveal() {
      const sr = ScrollReveal(); 
      const toastElements = document.querySelectorAll('.flex-wrap > div');
        
      
      if (toastElements) {
        toastElements.forEach((element) => { 
          
          
          setTimeout(() => {
            document.querySelector('#container').classList.remove('hidden')
            document.querySelector('#container').classList.add('flex')
            // element.classList.remove('hidden');
          }, 1);
          
          sr.reveal(element, {
            duration: 1000,
            origin: 'bottom',
            distance: `10px`,  
            easing: 'ease-in-out',
          });
            
        });
      }
    },
  },
};
</script>
