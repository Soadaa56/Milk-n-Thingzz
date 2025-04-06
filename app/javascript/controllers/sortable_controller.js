import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"
import { FetchRequest } from '@rails/request.js'

// Connects to data-controller="sortable"
export default class extends Controller {

  static values = {
    url: String,
    test: String
  }

  connect() {
    this.sortable = Sortable.create(this.element, {
      animation: 150,
      ghostClass: "sortable-ghost",
      chosenClass: "sortable-chosen",
      dragClass: "sortable-drag",
      draggable: ".sortable-item",
      onEnd: this.end.bind(this)
    })
  }

  async end(event) {
    console.log(event)
    console.log(`oldIndex: ${event.oldDraggableIndex} newIndex: ${event.newDraggableIndex}`)

    if (event.oldIndex === event.newIndex) {
      console.log("Same posistion, nothing changed")
      return
    }

    // Keep in mind the indices start at 0, but position starts at 1
    // example: Move first image to second position old_pos = 0, new_pos = 2
    const request = new FetchRequest('patch', `${this.urlValue}?old_position=${event.oldDraggableIndex}&new_position=${event.newDraggableIndex}`)
    const response = await request.perform()
    console.log(response)
  }
  
}