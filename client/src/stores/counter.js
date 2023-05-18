
import { defineStore } from 'pinia'
import axios from 'axios' 

import Toastify from 'toastify-js' 
import "toastify-js/src/toastify.css"

export const useDataStore = defineStore('data', {
  state: () => ({
    name: '',
    baseUrl: ' http://localhost:8000',
    patients: {},
    patient: {}, 
  }),
  getters: {},
  actions: {
    
    notif(message) {
      Toastify({ 
        text: message,
        duration: 3000,
        close: true,
      }).showToast();
    },
    showError(data) {
      Toastify({ 
        text: data.response.data.status.response,
        duration: 3000,
        close: true,
      }).showToast();
    },
    
    
    async getPatients() {
      try {
        const req = await axios({
          url: `${this.baseUrl}/patients`,
          method: 'get'
        })

        this.patients = req.data
        console.log(req.data, 'patients')
      } catch (error) {
        this.showError(error) 
      }
    },

    async getPatientById(id) {
      try {
        const req = await axios({
          url: `${this.baseUrl}/patients/${id}`,
          method: 'get'
        })
        this.patient = req.data
      } catch (error) {
        this.showError(error) 
      }
    },

    async deletePatientById(id) {
      try {
        const req = await axios({
          url: `${this.baseUrl}/patients/${id}`,
          method: 'delete'
        })
        this.notif("Patient's data has been deleted")
      } catch (error) {
        this.showError(error) 
      }
    },

    async addPatient(newData) {
      try {
        const pull = await axios({
          method: 'post',
          url: `${this.baseUrl}/patients`,
          headers: {
            'Content-Type': 'application/json'
          },
          data: newData
        })
        console.log(pull.data)
        this.notif('New patient added')
      } catch (error) {
        console.log(error.response.data.status.response)
        this.showError(error)
      }
    },

    async editPatient(id, daata) {
      // console.log(this.patient.result.id);
      const newData = this.patient
      try {
        const pull = await axios({
          method: 'put',
          url: `${this.baseUrl}/patients/${id}`,
          headers: {
            'Content-Type': 'application/json'
          },
          data: daata
        })
        this.notif("Patient's data has been edited")  
      } catch (error) {
        this.showError(error) 
      }
    } 
  }
})














