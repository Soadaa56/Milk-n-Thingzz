import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="gallery"
export default class extends Controller {
  static targets = [ "" ]

  connect() {
    console.log("Gallery")
    console.log(this)
  }
}
