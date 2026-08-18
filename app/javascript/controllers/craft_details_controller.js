import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="craft-details"
export default class extends Controller {
  static targets = [ "chevron", "details" ]

  connect() {
    console.log(this.detailsTarget)
  }

  toggleDetails() {
    this.detailsTarget.toggleAttribute('hidden')
  }
}
