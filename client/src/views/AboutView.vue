 
<template>
  <div>
    <Input :value="inputValue" @onchange="inputValue = $event" />
    <p>Nilai Input: {{ inputValue }}</p>
    <button @click="resetInput">Reset Input</button>
  </div>
</template>

<script>
import Input from '../components/atoms/InputTest.vue'; 

export default {
  components: {
    Input,
  },
  data() {
    return {
      inputValue: '',
    };
  },
  methods: {
    resetInput() {
      this.inputValue = '';
    },
  },
};
</script>
