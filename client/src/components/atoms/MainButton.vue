<template>
  <button
    @click="onClick"
    :type="buttonType"
    :class="` ${tailwind} text-white bg-${bg} focus:ring-4 focus:ring-blue-300 font-bold rounded-lg text-sm px-5 py-2.5  w-full  focus:outline-none `"
  >
    {{ label }}
  </button>
</template>

<script>
export default {
  props: {
    label: {
      type: String,
      required: true
    },
    bg: {
      type: String, 
    },
    tailwind: {
      type: String
    },
    onClick: {
      type: Function,
      required: true
    },
    buttonType: {
      type: String,
      default: "button"
    }
  }
};
</script>
 