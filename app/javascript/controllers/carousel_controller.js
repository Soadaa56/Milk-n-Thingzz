import { Controller } from "@hotwired/stimulus"
import { Carousel } from "bootstrap"

export default class extends Controller {
  connect() {
    console.log(this.element )
    this.carousel = new Carousel(this.element, {
        interval: false,
        touch: true,
        ride: false
      })

    this.element.querySelector(".carousel-item").classList.add("active")
  }
}
