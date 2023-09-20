import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comment"
export default class extends Controller {
  connect() {
    console.log("Testing 1234");
  }
  toggleForm() {
    console.log("I clicked the edit button")
  }
}
