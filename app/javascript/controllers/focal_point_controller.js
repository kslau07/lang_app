import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "radio" ]

  chooseRadio() {    
    if (!this.radioTarget.checked) {
      this.radioTarget.checked = true
    }
  }
}
