import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {

  connect() {
    new Typed(this.element, {
      strings: ["Let's get a coffee.\n", "Let's get a drink.", "Let's get dinner.",
      "Don't plan. Just do.", "Enter locations above."],
      typeSpeed: 60,
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
