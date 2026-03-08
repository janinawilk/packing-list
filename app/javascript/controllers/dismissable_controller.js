import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.timeout = setTimeout(() => this.fadeOut(), 3000)
  }

  disconnect() {
    clearTimeout(this.timeout)
  }

  dismiss() {
    clearTimeout(this.timeout)
    this.notification.remove()
  }

  fadeOut() {
    this.notification.classList.add("is-dismissing")
    setTimeout(() => this.notification.remove(), 300)
  }

  get notification() {
    return this.element.closest(".notification")
  }
}
