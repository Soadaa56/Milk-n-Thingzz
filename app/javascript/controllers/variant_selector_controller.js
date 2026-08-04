import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="variant-selector"
export default class extends Controller {
  static targets = [ "select", "display" ];

  connect() {
    const default_variant_id = this.selectTarget.value
    this.show_images(default_variant_id)
  }

  update() {
    const selected_variant_id = this.selectTarget.value
    this.show_images(selected_variant_id)
  }

  show_images(selected_variant_id) {
    this.displayTargets.forEach((element) => {
      element.hidden = element.dataset.id !== selected_variant_id
    })
  }
}
