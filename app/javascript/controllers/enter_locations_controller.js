import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="enter-locations"
export default class extends Controller {
  static targets = ["location1"]
  connect() {
  }
    // console.log("IT's alive")
    //   const myLatLng = { lat: -25.363, lng: 131.044 };
    //   const map = new google.maps.Map(this.sourceTarget, {
    //     zoom: 4,
    //     center: myLatLng,
    //   });

    //   new google.maps.Marker({
    //     position: myLatLng,
    //     map,
    //     title: "Hello World!",
    //   });
    // }

    // window.initMap = initMap;



  getUserLoc(e) {
    navigator.geolocation.getCurrentPosition((data) => {
      console.log(data.coords.latitude)
      console.log(data.coords.longitude)
    })
  }
}
