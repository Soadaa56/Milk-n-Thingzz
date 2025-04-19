import { Controller } from "@hotwired/stimulus"
import { Carousel } from "bootstrap"

export default class extends Controller {
  connect() {
    this.carousel = new Carousel(this.element, {
        interval: false,
        touch: true,
        ride: false
      })

    this.element.querySelector(".carousel-item").classList.add("active")
    this.element.querySelector(".carousel-indicator").classList.add("active")
  }
}
