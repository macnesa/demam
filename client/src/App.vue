<script >
import { RouterLink, RouterView } from 'vue-router' 
import Sidebar from './components/organism/Sidebar.vue';
import { useDataStore } from "./stores/counter";
import { mapActions } from 'pinia';


export default {
  components: {
    Sidebar
  },
  
  methods: {
    ...mapActions(useDataStore, ["getPatients"]),
  },
  
  mounted() {
    this.getPatients()
  },
  
} 


</script>

<template>
  <div class="h-[100vh] w-full box-border border-4 border-none | grid grid-flow-col  ">
    <Sidebar @clicked="changePart">
    </Sidebar> 
    <div class="p-5 pl-[200px] bg-white dark:bg-gray-900 ">
      <RouterView />
    </div>
  </div>
</template>
 