<template>
  <input type="text" :value="value" @input="updateValue" />
</template>

<script>
export default {
  props: ['value'],
  methods: {
    updateValue(event) {
      this.$emit('onchange', event.target.value);
    },
  },
};
</script>
