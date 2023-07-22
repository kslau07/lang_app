import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static classes = [ "toggleable" ]
  static targets = [ "checkmark" ]

  toggle() {
    this.checkmarkTarget.classList.toggle(this.toggleableClass)
  }
}
