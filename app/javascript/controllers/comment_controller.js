import { Controller } from "@hotwired/stimulus"
import { Alert } from "bootstrap";

// Connects to data-controller="comment"
export default class extends Controller {
  initialize() {  }
  connect() {  }
  toggleForm(e) {
    e.preventDefault();
    e.stopPropagation();
    const formID = e.params["form"];
    const commentBodyID = e.params["body"];
    const editButtonID = e.params["button"];
    const form = document.getElementById(formID)
    const commentBody = document.getElementById(commentBodyID);
    const editButton = document.getElementById(editButtonID);
    form.classList.toggle("d-none");
    commentBody.classList.toggle("d-none");
    if (editButton.innerHTML == "Back") {
      editButton.innerHTML = "Edit"
    } else {
      editButton.innerHTML = "Back"
    }
  }
}
