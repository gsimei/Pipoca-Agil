
import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = ["startTime", "endTime"]

  connect() {
    const options = {
      dateFormat: "d/m/Y", // Formato de data desejado (dd/mm/aaaa)
      allowInput: true,
    };

    flatpickr(this.startTimeTarget, options);
    flatpickr(this.endTimeTarget, options);
  }
}

