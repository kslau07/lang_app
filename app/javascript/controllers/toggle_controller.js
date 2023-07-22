import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static classes = [ "toggleable" ]
  static targets = [ "widget", "checkbox", "checkboxWrapper" ]

  toggleAll() {    
    this.widgetTargets.forEach(widget => {
      widget.classList.toggle(this.toggleableClass)
    });
  }

  

  toggleCheckbox() {
    console.log( this.checkboxWrapperTarget );
    // this.checkBoxWrapper.toggle(this.toggleableClass)
    
  }
}


// console.log( this.parentElement );
    // this.checkBoxWrapper.toggle(this.toggleableClass)
    // this.checkboxTargets.forEach(checkbox => {
    //   checkbox.classList.toggle(this.toggleableClass)
    // });    