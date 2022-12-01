import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"


// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Hey there!", "Let's find some suggestions!", "Bars, Coffee Shops...",
      "And many more available!", "Enter your locations above!"],
      typeSpeed: 50,
      loop: false,
      backSpeed: 500,
      backDelay: 500,
      fadeOut: true,
      fadeOutClass: 'typed-fade-out',
      fadeOutDelay: 500,
      showCursor: true,
    })
  }
}
