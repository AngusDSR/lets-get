import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="enter-locations"
export default class extends Controller {
  static targets = [
    // hidden form inputs
    "hiddenform", "meetname", "startlat", "startlong", "friendlat", "friendlong",
    // visible inputs
    "userlocation", "friendlocation", "locateicon", "cleartext", "suggestionscontainer", "friendsuggestionscontainer", "suggestedaddress", "friendsuggestedaddress"
  ]

  connect() {

    // console.log("enter-locations controller connected")

    // Initialize and add the map
    function initMap() {

      // The location of Charing Cross: change this later once we have location from user
      const area = { lat: 51.507221, long: -0.127600 };

      // The map, centered at Charing Cross
      let map = new google.maps.Map(document.getElementById("map"), {
        zoom: 12,
        center: area,
        disableDefaultUI: true,
        styles: [
          {
            "elementType": "geometry",
            "stylers": [
              {
                "color": "#1d2c4d"
              }
            ]
          },
          {
            "elementType": "labels.text.fill",
            "stylers": [
              {
                "color": "#8ec3b9"
              }
            ]
          },
          {
            "elementType": "labels.text.stroke",
            "stylers": [
              {
                "color": "#1a3646"
              }
            ]
          },
          {
            "featureType": "administrative.country",
            "elementType": "geometry.stroke",
            "stylers": [
              {
                "color": "#4b6878"
              }
            ]
          },
          {
            "featureType": "administrative.land_parcel",
            "elementType": "labels",
            "stylers": [
              {
                "visibility": "off"
              }
            ]
          },
          {
            "featureType": "administrative.land_parcel",
            "elementType": "labels.text.fill",
            "stylers": [
              {
                "color": "#64779e"
              }
            ]
          },
          {
            "featureType": "administrative.province",
            "elementType": "geometry.stroke",
            "stylers": [
              {
                "color": "#4b6878"
              }
            ]
          },
          {
            "featureType": "landscape.man_made",
            "stylers": [
              {
                "visibility": "off"
              }
            ]
          },
          {
            "featureType": "landscape.man_made",
            "elementType": "geometry.stroke",
            "stylers": [
              {
                "color": "#334e87"
              }
            ]
          },
          {
            "featureType": "landscape.natural",
            "elementType": "geometry",
            "stylers": [
              {
                "color": "#023e58"
              }
            ]
          },
          {
            "featureType": "poi",
            "elementType": "geometry",
            "stylers": [
              {
                "color": "#283d6a"
              }
            ]
          },
          {
            "featureType": "poi",
            "elementType": "labels.text",
            "stylers": [
              {
                "visibility": "off"
              }
            ]
          },
          {
            "featureType": "poi",
            "elementType": "labels.text.fill",
            "stylers": [
              {
                "color": "#6f9ba5"
              }
            ]
          },
          {
            "featureType": "poi",
            "elementType": "labels.text.stroke",
            "stylers": [
              {
                "color": "#1d2c4d"
              }
            ]
          },
          {
            "featureType": "poi.business",
            "stylers": [
              {
                "visibility": "off"
              }
            ]
          },
          {
            "featureType": "poi.park",
            "elementType": "geometry.fill",
            "stylers": [
              {
                "color": "#023e58"
              }
            ]
          },
          {
            "featureType": "poi.park",
            "elementType": "labels.text",
            "stylers": [
              {
                "visibility": "off"
              }
            ]
          },
          {
            "featureType": "poi.park",
            "elementType": "labels.text.fill",
            "stylers": [
              {
                "color": "#3C7680"
              }
            ]
          },
          {
            "featureType": "road",
            "elementType": "geometry",
            "stylers": [
              {
                "color": "#304a7d"
              }
            ]
          },
          {
            "featureType": "road",
            "elementType": "labels.text.fill",
            "stylers": [
              {
                "color": "#98a5be"
              }
            ]
          },
          {
            "featureType": "road",
            "elementType": "labels.text.stroke",
            "stylers": [
              {
                "color": "#1d2c4d"
              }
            ]
          },
          {
            "featureType": "road.arterial",
            "elementType": "labels",
            "stylers": [
              {
                "visibility": "off"
              }
            ]
          },
          {
            "featureType": "road.highway",
            "elementType": "geometry",
            "stylers": [
              {
                "color": "#2c6675"
              }
            ]
          },
          {
            "featureType": "road.highway",
            "elementType": "geometry.stroke",
            "stylers": [
              {
                "color": "#255763"
              }
            ]
          },
          {
            "featureType": "road.highway",
            "elementType": "labels",
            "stylers": [
              {
                "visibility": "off"
              }
            ]
          },
          {
            "featureType": "road.highway",
            "elementType": "labels.text.fill",
            "stylers": [
              {
                "color": "#b0d5ce"
              }
            ]
          },
          {
            "featureType": "road.highway",
            "elementType": "labels.text.stroke",
            "stylers": [
              {
                "color": "#023e58"
              }
            ]
          },
          {
            "featureType": "road.local",
            "stylers": [
              {
                "visibility": "off"
              }
            ]
          },
          {
            "featureType": "road.local",
            "elementType": "labels",
            "stylers": [
              {
                "visibility": "off"
              }
            ]
          },
          {
            "featureType": "transit",
            "elementType": "labels.text.fill",
            "stylers": [
              {
                "color": "#98a5be"
              }
            ]
          },
          {
            "featureType": "transit",
            "elementType": "labels.text.stroke",
            "stylers": [
              {
                "color": "#1d2c4d"
              }
            ]
          },
          {
            "featureType": "transit.line",
            "elementType": "geometry.fill",
            "stylers": [
              {
                "color": "#283d6a"
              }
            ]
          },
          {
            "featureType": "transit.station",
            "elementType": "geometry",
            "stylers": [
              {
                "color": "#3a4762"
              }
            ]
          },
          {
            "featureType": "transit.station.airport",
            "stylers": [
              {
                "visibility": "off"
              }
            ]
          },
          {
            "featureType": "water",
            "elementType": "geometry",
            "stylers": [
              {
                "color": "#0e1626"
              }
            ]
          },
          {
            "featureType": "water",
            "elementType": "labels.text.fill",
            "stylers": [
              {
                "color": "#4e6d70"
              }
            ]
          }
        ]
      });

      // NO MARKERS YET
      // const marker = new google.maps.Marker({
      //   position: area,
      //   map: map,
      // });
    }

    window.initMap = initMap;

  }

  // should be applicable to both fields with one function
  clearInput() {
    console.log("clear field")
    this.userlocationTarget.value = null
  }

  getUserLoc(e) {
    navigator.geolocation.getCurrentPosition((data) => {
      const area = {
        lat: data.coords.latitude,
        long: data.coords.longitude
      }
      this.startlatTarget.value = area.lat;
      this.startlongTarget.value = area.long;
      this.meetnameTarget.value = `${area.lat}, ${area.long} ▬ `;
    })
  }

  userSuggestions(e){
    // clear suggestions -> put into a function
    const suggestionsContainer = this.suggestionscontainerTarget;
    while (suggestionsContainer.firstChild) {
      suggestionsContainer.removeChild(suggestionsContainer.firstChild);
    }

    const MAPBOX_API="pk.eyJ1IjoiYW5ndXNkc3IiLCJhIjoiY2xhdmg0emczMDV2aTN4c2poN3h4Zmt4biJ9.cO_Bdy27d_tf2rhtLRFPFw"
    let mapbox_call = `https://api.mapbox.com/geocoding/v5/mapbox.places/${this.userlocationTarget.value}.json?country=gb&limit=4&types=place%2Cpostcode%2Caddress&language=en&autocomplete=true&fuzzyMatch=true&routing=false&access_token=${MAPBOX_API}`
    fetch(mapbox_call, {
      method: "GET",
      headers: { "Accept": "application/json" }
    })
    .then(response => response.json())
    .then((data) => {
      // suggestionsContainer.after(suggestions)
      for (let results of data.features) {
        let suggested_address = document.createElement("P");
        suggested_address.classList.add("suggested-address")
        suggested_address.innerText = results.place_name.replace(', United Kingdom','');
        suggested_address.setAttribute("data-enter-locations-target", "suggestedaddress");
        suggested_address.setAttribute("data-coords", results.center);
        suggested_address.setAttribute("data-action", "click->enter-locations#selectUserAddress");
        suggestionsContainer.append(suggested_address);
      }
    });
  }

  selectUserAddress(e) {
    // needs to be more stimulus - later
    const address =  this.suggestedaddressTarget.innerText;
    this.userlocationTarget.value = address
    this.meetnameTarget.value = `${address.substring(0,address.search(',')).trim()} ▬ `;
    this.startlatTarget.value = this.suggestedaddressTarget.dataset.coords.split(',')[1];
    this.startlongTarget.value = this.suggestedaddressTarget.dataset.coords.split(',')[0];

    // clear suggestions -> put into a function
    const suggestionsContainer = document.querySelector(".results-container");
    while (suggestionsContainer.firstChild) {
      suggestionsContainer.removeChild(suggestionsContainer.firstChild);
    }

    // update map here
    // [ MAP ADDS USER MARKER ]

  }

  friendSuggestions(e){
    // clear suggestions -> put into a function
    const suggestionsContainer = this.friendsuggestionscontainerTarget;
    while (suggestionsContainer.firstChild) {
      suggestionsContainer.removeChild(suggestionsContainer.firstChild);
    }

    const MAPBOX_API="pk.eyJ1IjoiYW5ndXNkc3IiLCJhIjoiY2xhdmg0emczMDV2aTN4c2poN3h4Zmt4biJ9.cO_Bdy27d_tf2rhtLRFPFw"
    let mapbox_call = `https://api.mapbox.com/geocoding/v5/mapbox.places/${this.friendlocationTarget.value}.json?country=gb&limit=4&proximity=ip&types=place%2Cpostcode%2Caddress&language=en&autocomplete=true&fuzzyMatch=true&routing=false&access_token=${MAPBOX_API}`

    fetch(mapbox_call, {
      method: "GET",
      headers: { "Accept": "application/json" }
    })
    .then(response => response.json())
    .then((data) => {
      for (let results of data.features) {
        let suggested_address = document.createElement("P");
        suggested_address.classList.add("suggested-address")
        suggested_address.innerText = results.place_name.replace(', United Kingdom','');
        suggested_address.setAttribute("data-enter-locations-target", "friendsuggestedaddress");
        suggested_address.setAttribute("data-coords", results.center);
        suggested_address.setAttribute("data-action", "click->enter-locations#selectFriendAddress");
        suggestionsContainer.append(suggested_address);
      }
    });
  }

  selectFriendAddress(e) {
    const address =  this.friendsuggestedaddressTarget.innerText;
    // needs to be more stimulus - later
    this.friendlocationTarget.value = address
    this.meetnameTarget.value += ` ▬ ${address.substring(0,address.search(',')).trim()}`;
    this.friendlatTarget.value = this.friendsuggestedaddressTarget.dataset.coords.split(',')[1];
    this.friendlongTarget.value = this.friendsuggestedaddressTarget.dataset.coords.split(',')[0];

    // clear suggestions -> put into a function
    const suggestionsContainer = this.friendsuggestionscontainerTarget;
    while (suggestionsContainer.firstChild) {
      suggestionsContainer.removeChild(suggestionsContainer.firstChild);
    }

    // update map here
    // [ MAP ADDS USER MARKER ]

    // SUBMITS HIDDEN FORM
    this.hiddenformTarget.submit();
  }




}
