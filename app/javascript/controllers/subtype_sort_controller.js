import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="subtype-sort"
export default class extends Controller {
  static targets = ["select"];
  connect() {
  }

  update() {
    this.sortCrafts();
  }

  sortCrafts() {
    const sortBy = this.selectTarget.value;
    const url = `/home/earring?sort_by=${sortBy}`;

    Turbo.visit(url);
  }
}
