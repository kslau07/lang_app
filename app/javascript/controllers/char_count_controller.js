import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "output"]
  static classes = ["color"]
  
  connect() {
    this.charactersLeft()
  }

  charactersLeft() {
    const charLimit = 5
    const charsLeft = charLimit - this.inputTarget.value.length
    const targ = this.outputTarget
    targ.textContent = charsLeft.toString()
    this.updateColor(charsLeft, targ)
  }

  updateColor(charsLeft, targ) {
    if (charsLeft == -1) {
      targ.classList.add(this.colorClass)
    } else if (charsLeft == 0) {
      targ.classList.remove(this.colorClass)
    }
  }
}
