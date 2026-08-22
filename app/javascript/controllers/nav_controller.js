import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="nav"
export default class extends Controller {
  connect() {}

  openNav() {
    document.body.classList.add('nav-is-open')
  }

  closeNav() {
    document.body.classList.remove('nav-is-open')
  }
}
