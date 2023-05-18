<template>
  <div class="w-full">
    <div class="flex justify-between">
      <p class="text-sm font-semibold">{{ label1 }}</p>
      <p class="text-sm text-gray-500">{{ label2 }}</p>
    </div>
    <div
      @drop="handleDrop"
      @dragover="handleDragOver"
      class="flex my-1 items-center justify-center w-full"
    >
      <label
        for="file-input"
        :class="[
          'flex flex-col items-center',
          isDrag ? 'bg-primary-100' : '',
          'justify-center w-full h-64 border-2 border-gray-300 border-dashed rounded-lg cursor-pointer'
        ]"
      >
        <template v-if="selectedFile">
          <img
            :src="URL.createObjectURL(selectedFile)"
            alt="Selected file"
            class="h-48 object-contain"
          />
        </template>
        <template v-else>
          <template v-if="selectedFiles.length > 0">
            <div class="flex gap-2">
              <template v-for="(file, index) in selectedFiles" :key="index">
                <div class="m-2">
                  <img
                    :src="URL.createObjectURL(file)"
                    alt="Selected file"
                    class="h-32 w-32 object-contain"
                  />
                </div>
              </template>
            </div>
          </template>
          <template v-else>
            <svg
              aria-hidden="true"
              :class="[
                'w-10 h-10 mb-3',
                isDrag ? 'text-white' : 'text-gray-400'
              ]"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"
              ></path>
            </svg>
            <p
              :class="[
                'mb-2 text-sm',
                isDrag ? 'text-white' : 'text-gray-500'
              ]"
            >
              <span class="font-semibold">Click to upload</span> or drag and drop
            </p>
            <p
              :class="[
                'text-xs text-center',
                isDrag ? 'text-white' : 'text-gray-500'
              ]"
            >
              {{ desc }}
            </p>
          </template>
        </template>

        <input
          id="file-input"
          type="file"
          :multiple="multiple"
          class="hidden"
          accept=".jpg,.jpeg,.png,.gif"
          @change="handleFile"
        />
      </label>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Dropzone',
  props: {
    id: {
      type: String,
      default: ''
    },
    children: {
      type: [Object, Array],
      default: null
    },
    label1: {
      type: [Object, Array],
      default: null
    },
    label2: {
      type: [Object, Array],
      default: null
    },
    label2_tailwind: {
      type: String,
      default: ''
    },
    desc: {
      type: [Object, Array],
      default: null
    },
    value: {
      type: [Object, Array],
      default: null
    },
    tailwind: {
      type: String,
      default: ''
    },
    placeholder: {
      type: String,
      default: ''
    },
    onFileInput: {
      type: Function,
      default: null
    },
    multiple: {
      type: [Boolean, Array],
      default: false
    }
  },
  data() {
    return {
      selectedFile: null,
      selectedFiles: [],
      isDrag: false
    };
  },
  methods: {
    handleFile(event) {
      const data = event.target.files;
      if (!data) return;
      if (this.multiple) {
        this.selectedFiles = Array.from(data);
      } else {
        this.selectedFile = data[0];
      }
      if (this.onFileInput) {
        this.onFileInput(this.multiple ? Array.from(data) : data[0]);
      }
    },
    handleDragOver(event) {
      event.preventDefault();
      this.isDrag = true;
    },
    handleDrop(event) {
      event.preventDefault();
      const data = Array.from(event.dataTransfer.files);
      if (!data) return;
      if (this.multiple) {
        this.selectedFiles = data;
      } else {
        this.selectedFile = data[0];
      }
      if (this.onFileInput) {
        this.onFileInput(this.multiple ? data : data[0]);
      }
      this.isDrag = false;
    }
  }
};
</script>

<style scoped>
/* Tambahkan gaya khusus untuk komponen ini jika diperlukan */
</style>
