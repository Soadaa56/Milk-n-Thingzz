import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cart-quantity"
export default class extends Controller {
  static targets = [ "plus", "minus" ]
  static values = {
    itemQuantity: Number,
    itemMaxQuantity: Number
  }

  initialize() {}
  connect() {
    console.log("Current:", this.itemQuantityValue)
    console.log("Max:", this.itemMaxQuantityValue)
  }

  increment() {
    if (this.itemQuantityValue >= this.itemMaxQuantityValue) {
      this.plusTarget.disabled = true
    }
  }

  decrement() {
    if (this.itemQuantityValue <= 1) {
      this.minusTarget.disabled = true
    }
  }
}
