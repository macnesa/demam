<template>
  <div class="flex items-center">
    <input
      :id="id"
      type="radio"
      :name="name"
      :checked="checked"
      :value="value" 
      @change="$emit('onchange', $event.target.value)" 
      :class="`w-4 h-4 text-${bg} bg-gray-100 border-gray-300 focus:ring-${bg}`"
    />

    <label
      :for="id"
      class="ml-4 text-sm text-gray-900 dark:text-gray-300"
    >
      {{ label1 }}
      <span class="block text-xs text-primary-100">
        {{ label2 }}
      </span>
    </label>
  </div>
</template>

<script>
export default {
  props: {
    bg: {
      type: String,
      default: 'blue-500'
    },
    id: String,
    name:String,
    label1: String,
    label2: [String, Object],
    value: String,
    checked: Boolean,
    onChange: {
      type: Function,
      default: () => {}
    }
  }
};
</script>
