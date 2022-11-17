import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="enter-locations"
export default class extends Controller {
  static targets = ["location1"]
  connect() {
    // console.log("IT's alive")
  }

  getUserLoc(e) {
    navigator.geolocation.getCurrentPosition((data) => {
      console.log(data.coords.latitude)
      console.log(data.coords.longitude)
    })
  }
}
