import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("dfgdfg");
    this.element.textContent = "Hello World!"
  }
}
