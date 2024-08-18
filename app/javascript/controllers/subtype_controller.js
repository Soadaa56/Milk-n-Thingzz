import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="subtype"
export default class extends Controller {
  static targets = ["subtype"]

  connect() {
    console.log("Subtype Controller Connected");
    this.updateSubtype();
  }

  updateSubtype(event) {
    const category = event ? event.target.value : this.element.querySelector('select').value;
    const allSubtypes = {
      "Earring": ["Floral", "Bear"]
    };
    const subtypeSelect = document.querySelector("#craft_subtype");
    const subtypes = allSubtypes[category] || [];

    // Clear previous options
    subtypeSelect.innerHTML = "";

    // Add new options
    subtypes.forEach(subtype => {
      const option = document.createElement("option");
      option.value = subtype;
      option.textContent = subtype;
      subtypeSelect.appendChild(option);
    });
  }
}
