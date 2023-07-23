import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static classes = ["toggleable"]
  static targets = ["widget", "checkbox", "checkboxLabel"]

  toggleAll() {
    this.widgetTargets.forEach(widget => {
      widget.classList.toggle(this.toggleableClass)
    })
  }

  toggleCheckbox(event) {
    this.checkboxLabelTargets.forEach(label => {
      if (event.target.name == label.getAttribute("for")) {
        label.classList.toggle(this.toggleableClass)
      }
    })
  }
}