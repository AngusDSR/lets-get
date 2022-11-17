import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="enter-locations"
export default class extends Controller {
  static targets = ["location1"]
  connect() {
    console.log("IT's alive")
    console.log(this.location1Target)
    // console.log(this.itemsTarget)
    // console.log(this.formTarget)
  }

  getUserLoc(e) {
    console.log(e);
    console.log("clicked");
    // this.location1Target
  }
}
