import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize() {  }
  connect() {  }
  
  openMenu(e){
    e.preventDefault();
    e.stopPropagation();
    
    const menuMobile = document.querySelector("#mobile-popup-menu");
    menuMobile.classList.toggle("d-none");
  }

  closeMenu(e) {
    e.preventDefault();
    e.stopPropagation();

    const menuMobile = document.querySelector("#mobile-popup-menu");
    menuMobile.classList.add("d-none");
  }
}