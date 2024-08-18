import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="subtype-sort"
export default class extends Controller {
  connect() {
    console.log("subtype-sort controller connected");
  }

  update() {
    console.log("Update Clicked");
  }
}
