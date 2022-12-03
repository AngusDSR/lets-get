import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"


// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Let's get a coffee", "Let's get a drink", "Let's get dinner",
      "Let's make a plan - Enter locations above"],
      typeSpeed: 50,
      loop: false,
      backSpeed: 500,
      backDelay: 500,
      fadeOut: true,
      fadeOutClass: 'typed-fade-out',
      fadeOutDelay: 500,
      showCursor: false,
    })
  }
}
