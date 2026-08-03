import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="variant-selector"
export default class extends Controller {
  static targets = [ "select", "display" ];
  // static values = { id: Number };

  connect() {}

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
