import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="gallery"
export default class extends Controller {
  static targets = [ "main", "thumbnail" ]

  connect() {
  }

  inspect(e) {
    console.log(this.mainTarget.dataset.detail)
    console.log(e.currentTarget.dataset.detail)
  }

  swap(e) {
    e.preventDefault()
    const thumb = e.currentTarget
    const main = this.mainTarget

    const clicked = { detail: thumb.dataset.detail, small: thumb.dataset.small }
    const current = { detail: main.dataset.detail, small: main.dataset.small }

    main.src = clicked.detail
    main.dataset.detail = clicked.detail
    main.dataset.small = clicked.small

    thumb.src = current.small
    thumb.dataset.detail = current.detail
    thumb.dataset.small = current.small
  }
}
