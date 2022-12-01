import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="business-show-map"
export default class extends Controller {
  static targets = [ "busshowmap", "business" ]

  connect() {
    console.log('connected to business-show-map controller')
  }
}
