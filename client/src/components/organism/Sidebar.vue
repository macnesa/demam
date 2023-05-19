
<script> 
  export default { 
    emits: ['clicked'],
    methods: {
    changePart(value) { 
    //    this.$emit('clicked', value)
       this.$router.push(value)
    }
    }
  }

</script>

<template>  
  <div class="fixed h-[100%] | grid grid-flow-col grid-cols-[0.2fr_1fr] " >
        <div class="h-[100%] p-2 pt-[27px]  text-[17px]  border-gray-200 bg-blue-900 | grid content-start child:mb-[25px] ">
          <a @click="changePart('/')" class=" cursor-pointer | flex items-center text-white color-white gap-2"><span class="material-symbols-outlined ">home</span></a>
          <a @click="changePart('/add')" class=" cursor-pointer | flex items-center text-white  gap-2"><span class="material-symbols-outlined">add</span></a> 
          <a class="mt-[4px] font-bold cursor-pointer   | flex items-center  gap-2 "></a>
          <!-- <a class=" cursor-pointer | flex items-center gap-2"><span class="material-symbols-outlined"> person </span> </a> -->
          <!-- <a @click="changePart('logout')" class=" cursor-pointer | text-white  flex items-center gap-2"><span class="material-symbols-outlined"> logout </span></a> -->
        </div>
        <aside class=" h-full" aria-label="Sidenav">
          <div class="overflow-y-auto py-5 px-3 h-full bg-white border-r border-gray-200 dark:bg-gray-900 dark:border-gray-700">
          <ul class="space-y-2">
              <li>
                  <a @click="changePart('/')" href="#" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                      <span class="ml-3">Dashboard</span>
                  </a>
              </li>
              <li>
                  <button @click="changePart('/add')" type="button" class="flex items-center p-2 w-full text-base font-normal text-gray-900 rounded-lg transition duration-75 group hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700" aria-controls="dropdown-pages" data-collapse-toggle="dropdown-pages">
                      <span class="flex-1 ml-3 text-left whitespace-nowrap">Add</span>
                  </button> 
              </li>  
          </ul>
          <ul class="pt-5 mt-5 space-y-2 border-t border-gray-200 dark:border-gray-700">
                <!-- <li>
                <a href="#" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg transition duration-75 hover:bg-gray-100 dark:hover:bg-gray-700 dark:text-white group">
                    <span clAass="ml-3">Docs</span>
                </a>
            </li> -->
              <li>
                  <a href="#" class="flex pointer-events-none items-center p-2 text-base font-normal text-gray-900 rounded-lg transition duration-75 hover:bg-gray-100 dark:hover:bg-gray-700 dark:text-white group">
                      <span class="ml-3">Zi.Care</span>
                  </a>
              </li> 
          </ul>
      </div> 
    </aside>
      </div> 
      
</template>