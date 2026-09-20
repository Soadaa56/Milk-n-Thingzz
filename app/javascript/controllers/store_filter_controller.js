import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="store-filter"
export default class extends Controller {
  static targets = ["overlay", "filterBar", "crafts"]

  open() {
    this.overlayTarget.classList.add("active")
    this.filterBarTarget.classList.add("active")
  }

  close() {
    this.overlayTarget.classList.remove("active")
    this.filterBarTarget.classList.remove("active")
  }

  change() {
    console.log("change triggered")
  }

  submit() {
    this.close()
  }
}
