import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }
  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      // style: "mapbox://styles/mapbox/streets-v10"
      style: "mapbox://styles/stylingmaps/clthv2fxu00lt01r5fyl927va"
      // style: "mapbox.com/styles/v1/stylingmaps/clthv2fxu00lt01r5fyl927va.html?title=view&access_token=pk.eyJ1Ijoic3R5bGluZ21hcHMiLCJhIjoiY2x0aHR6cGhqMDkxZjJxcnI4OGkzMTQ0cSJ9.PGiIVYk0RQ2a5dwSUtR7kA&zoomwheel=true&fresh=true#15.02/-37.77344/145.08003"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }
  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
