import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  static targets = [ "startTime", "endTime" ]

  connect() {
    const unvailableDates = JSON.parse(document.querySelector('.widget-content').dataset.unavailable)
    console.log(unvailableDates)
    flatpickr(this.startTimeTarget, {
      minDate: 'today',
      dateFormat: 'Y-m-d',
      disable: unvailableDates
    })
    flatpickr(this.endTimeTarget, {
      dateFormat: 'Y-m-d',
      disable: unvailableDates
      })
  }
}
