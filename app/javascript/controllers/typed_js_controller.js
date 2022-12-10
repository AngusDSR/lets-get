import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {

  connect() {

    // console.log("Connected to data-controller: typed-js")

    new Typed(this.element, {
      strings: ["Don't know where to meet?", "Enter your locations above and plan to meet now."],
      typeSpeed: 80,
      backSpeed: 40,
      backDelay: 1400,
      // fadeOutDelay: 1400,
      smartBackspace: true,
      loop: true,
      // fadeOut: true,
      showCursor: false,
      fadeOutClass: 'typed-fade-out',
    })
  }
}
