import { Loader } from "@googlemaps/js-api-loader"
export default {
  mounted() {
    const hook = this;
    // the element hooked
    elt = hook.el;
    hook.map = null;
    api_key = document.querySelector("meta[name='google-maps-api-key']").getAttribute("content")
    const loader = new Loader({
      apiKey: api_key,
      version: "weekly"
    });
    let markers = [];
    loader
      .importLibrary('maps')
      .then(({Map}) => {
        hook.map = new Map(elt, {
          center: { lat: 37.75913305763491, lng: -122.43751994083065 },
          zoom: 11,
          // additional map configuration attributes
          zoomControl: true,
          mapTypeControl: false,
          scaleControl: false,
          streetViewControl: false,
          rotateControl: false,
          fullscreenControl: true,
          styles: [
            {
              "featureType": "all",
              "stylers": [
                { "saturation": -100 }
              ]
            },
            {
              "featureType": "water",
              "stylers": [
                { "saturation": 0 ,
                "color": "#79b0cb"
              }
              ]
            }
          ]
        });

        hook.updateMarkers = function(targets) {
            markers.forEach((marker) => {
                marker.setMap(null);
            });
            markers = [];
            targets.forEach(({id, applicant, latitude, longitude}) => { 
                const marker = new google.maps.Marker({
                    position: { lat: latitude, lng: longitude },
                    map: hook.map,
                    title: applicant,
                    label: {text: applicant, fontSize: "0.8rem", color: 'rgb(0 0 0)' }
                });
                markers.push(marker);
            });
        }

        hook.map.addListener("bounds_changed", () => {
            const bounds = hook.map.getBounds()
            hook.pushEvent("bounds-changed", {bounds})
        });

        // let's update the map with data provided in dom object
        const targets = JSON.parse(hook.el.dataset.targets)
        hook.updateMarkers(targets);
    });

    hook.handleEvent("update_markers", (payload) => {
        console.log("event-markers");
        hook.updateMarkers(payload.data);
    });
  }
}