import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs" // Add this line, to access the sortablejs library

// Connects to data-controller="sortable"
export default class extends Controller {
  connect() {
    console.log("Sortable controller connected")
  }
}