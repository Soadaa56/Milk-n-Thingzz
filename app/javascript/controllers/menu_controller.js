import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize() {  }
  connect() {
    console.log("test connection");
    const menuButton = document.getElementById("mobile-menu-button");
    if (menuButton) {
      menuButton.addEventListener("click", this.toggleMenu.bind(this));
    }
  }

  toggleMenu(e){
    e.preventDefault();
    e.stopPropagation();

    const menuMobile = document.getElementById("mobile-popup-menu");
    menuMobile.classList.toggle("d-none");
    console.log("test button")
  }



}