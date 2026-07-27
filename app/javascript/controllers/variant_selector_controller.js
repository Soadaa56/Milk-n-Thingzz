import { Controller } from "@hotwired/stimulus";

//Connects to data-controller="variant-selector"
export default class extends Controller {
    static targets = ["select", "carousel"]

    connect() {
        console.log("var connect: ", this.selectTarget.value)
        this.showVariant(this.selectTarget.value)
    }

    select() {
        this.showVariant(this.selectTarget.value)
    }

    showVariant(variantId) {
        this.carouselTargets.forEach(carousel => {
            carousel.hidden = carousel.dataset.variantId !== String(variantId)
        })
    }
}