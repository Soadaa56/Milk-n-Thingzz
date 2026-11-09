import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cart-quantity"
export default class extends Controller {
  static targets = [ "plus", "minus" ]
  static values = {
    itemQuantity: Number,
    itemMaxQuantity: Number
  }

  connect() {
    if (this.itemQuantityValue >= this.itemMaxQuantityValue) {
      this.plusTarget.disabled = true
      this.plusTarget.classList.add("disabled")
    }
    
    if (this.itemQuantityValue <= 1) {
      this.minusTarget.disabled = true
      this.minusTarget.classList.add("disabled")
    }
  }

  increment() {
    if (this.itemQuantityValue >= this.itemMaxQuantityValue) {
      this.plusTarget.disabled = true
      this.plusTarget.classList.add("disabled")
    }
  }

  decrement() {
    if (this.itemQuantityValue <= 1) {
      this.minusTarget.disabled = true
      this.minusTarget.classList.add("disabled")
    }
  }
}
