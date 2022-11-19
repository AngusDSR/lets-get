import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="enter-locations"
export default class extends Controller {
  static targets = ["location1"]
  connect() {

    console.log("places")

    // Initialize and add the map
    function initMap() {

      // The location of Charing Cross: change this later once we have location from user
      const area = { lat: 51.507221, lng: -0.127600 };

      // incommenting this map the maps work

      // The map, centered at Charing Cross
      // let map = new google.maps.Map(document.getElementById("map"), {
      //   zoom: 12,
      //   center: area,
      //   disableDefaultUI: true,
      //   styles: [
      //     {
      //       "elementType": "geometry",
      //       "stylers": [
      //         {
      //           "color": "#1d2c4d"
      //         }
      //       ]
      //     },
      //     {
      //       "elementType": "labels.text.fill",
      //       "stylers": [
      //         {
      //           "color": "#8ec3b9"
      //         }
      //       ]
      //     },
      //     {
      //       "elementType": "labels.text.stroke",
      //       "stylers": [
      //         {
      //           "color": "#1a3646"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "administrative.country",
      //       "elementType": "geometry.stroke",
      //       "stylers": [
      //         {
      //           "color": "#4b6878"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "administrative.land_parcel",
      //       "elementType": "labels",
      //       "stylers": [
      //         {
      //           "visibility": "off"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "administrative.land_parcel",
      //       "elementType": "labels.text.fill",
      //       "stylers": [
      //         {
      //           "color": "#64779e"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "administrative.province",
      //       "elementType": "geometry.stroke",
      //       "stylers": [
      //         {
      //           "color": "#4b6878"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "landscape.man_made",
      //       "stylers": [
      //         {
      //           "visibility": "off"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "landscape.man_made",
      //       "elementType": "geometry.stroke",
      //       "stylers": [
      //         {
      //           "color": "#334e87"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "landscape.natural",
      //       "elementType": "geometry",
      //       "stylers": [
      //         {
      //           "color": "#023e58"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "poi",
      //       "elementType": "geometry",
      //       "stylers": [
      //         {
      //           "color": "#283d6a"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "poi",
      //       "elementType": "labels.text",
      //       "stylers": [
      //         {
      //           "visibility": "off"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "poi",
      //       "elementType": "labels.text.fill",
      //       "stylers": [
      //         {
      //           "color": "#6f9ba5"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "poi",
      //       "elementType": "labels.text.stroke",
      //       "stylers": [
      //         {
      //           "color": "#1d2c4d"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "poi.business",
      //       "stylers": [
      //         {
      //           "visibility": "off"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "poi.park",
      //       "elementType": "geometry.fill",
      //       "stylers": [
      //         {
      //           "color": "#023e58"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "poi.park",
      //       "elementType": "labels.text",
      //       "stylers": [
      //         {
      //           "visibility": "off"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "poi.park",
      //       "elementType": "labels.text.fill",
      //       "stylers": [
      //         {
      //           "color": "#3C7680"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "road",
      //       "elementType": "geometry",
      //       "stylers": [
      //         {
      //           "color": "#304a7d"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "road",
      //       "elementType": "labels.text.fill",
      //       "stylers": [
      //         {
      //           "color": "#98a5be"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "road",
      //       "elementType": "labels.text.stroke",
      //       "stylers": [
      //         {
      //           "color": "#1d2c4d"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "road.arterial",
      //       "elementType": "labels",
      //       "stylers": [
      //         {
      //           "visibility": "off"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "road.highway",
      //       "elementType": "geometry",
      //       "stylers": [
      //         {
      //           "color": "#2c6675"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "road.highway",
      //       "elementType": "geometry.stroke",
      //       "stylers": [
      //         {
      //           "color": "#255763"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "road.highway",
      //       "elementType": "labels",
      //       "stylers": [
      //         {
      //           "visibility": "off"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "road.highway",
      //       "elementType": "labels.text.fill",
      //       "stylers": [
      //         {
      //           "color": "#b0d5ce"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "road.highway",
      //       "elementType": "labels.text.stroke",
      //       "stylers": [
      //         {
      //           "color": "#023e58"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "road.local",
      //       "stylers": [
      //         {
      //           "visibility": "off"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "road.local",
      //       "elementType": "labels",
      //       "stylers": [
      //         {
      //           "visibility": "off"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "transit",
      //       "elementType": "labels.text.fill",
      //       "stylers": [
      //         {
      //           "color": "#98a5be"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "transit",
      //       "elementType": "labels.text.stroke",
      //       "stylers": [
      //         {
      //           "color": "#1d2c4d"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "transit.line",
      //       "elementType": "geometry.fill",
      //       "stylers": [
      //         {
      //           "color": "#283d6a"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "transit.station",
      //       "elementType": "geometry",
      //       "stylers": [
      //         {
      //           "color": "#3a4762"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "transit.station.airport",
      //       "stylers": [
      //         {
      //           "visibility": "off"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "water",
      //       "elementType": "geometry",
      //       "stylers": [
      //         {
      //           "color": "#0e1626"
      //         }
      //       ]
      //     },
      //     {
      //       "featureType": "water",
      //       "elementType": "labels.text.fill",
      //       "stylers": [
      //         {
      //           "color": "#4e6d70"
      //         }
      //       ]
      //     }
      //   ]
      // });

      // NO MARKERS YET
      // const marker = new google.maps.Marker({
      //   position: area,
      //   map: map,
      // });

    }

    window.initMap = initMap;

  }

  getUserLoc(e) {

    console.log("clicked")

    navigator.geolocation.getCurrentPosition((data) => {
      const area = {
        lat: data.coords.latitude,
        lng: data.coords.longitude
      }
      console.log(area);
    })




  }
}
