import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comment"
export default class extends Controller {
  initialize() {
    console.log("Initialized!");
  }
  connect() {
    console.log("Testing 123");
  }
  toggleForm() {
    console.log("I clicked the edit button")
  }
}
