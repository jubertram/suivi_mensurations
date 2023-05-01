import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = ['startTime', 'endTime']

  connect() {
    flatpickr(this.startTimeTarget, {
      dateFormat: "l d M",
    })
    flatpickr(this.endTimeTarget, {
      dateFormat: "l d M",
    })
  }
}
