import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs" // access the sortablejs library
import { FetchRequest } from '@rails/request.js'

// Connects to data-controller="sortable"
export default class extends Controller {
  connect() {
    console.log("Sortable controller connected")
    console.log("test")
    
    this.sortable = Sortable.create(this.element, {
      animation: 150,
    })
  }
}