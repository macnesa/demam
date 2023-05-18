<script>
export default {
  props: {
    id: {
      type: String,
      default: undefined,
    },
    placeholder: {
      type: String,
      default: undefined,
    },
    value: {
      default: undefined,
    },  
    type: {
      type: String,
      default: undefined,
    },
    bg: {
      type: String,
      default: "[#f1f1f1]",
    },
    text: {
      type: String,
      default: undefined,
    },
    label1: {
      default: undefined,
    },
    label2: {
      default: undefined,
    },
    label2_tailwind: {
      type: String,
      default: undefined,
    },
    label3: {
      default: undefined,
    },
    tailwind: {
      type: String,
      default: undefined,
    },
    min: {
      type: Number,
      default: undefined,
    },
  }, 
  
};
</script>


<template>
  <div class="w-full">
    <div class="flex justify-between">
      <h1 class="text-sm font-medium text-gray-900 dark:text-white">{{ label1 ? label1 : '' }}</h1>
      <p class="text-sm text-gray-500">{{ label3 ? label3 : '' }}</p>
    </div>
    <input
      :type="type"
      :id="id"
      :class="`${tailwind} text-${text} bg-${bg} border my-1 border-gray-300 text-black text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500`"
      :placeholder="placeholder"
      :value="value"  
      :min="min"
      @input="$emit('onchange', $event.target.value)"
    />
    <p class="text-xs text-gray-500" :class="label2_tailwind">{{ label2 }}</p>
  </div>
</template> 
