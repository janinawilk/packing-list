import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["checkbox"]

  toggle(event) {
    event.preventDefault()
    this.checkboxTarget.checked = !this.checkboxTarget.checked
    this.element.classList.toggle("is-primary")
    this.element.classList.toggle("is-outlined")
  }
}
