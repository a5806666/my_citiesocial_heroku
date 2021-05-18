import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = [ "email" ]

  add(event) {
    event.preventDefault();
    let email = this.emailTarget.value.trim();
    // console.log(email)
    let data = new FormData();
    data.append("subscribe['email']", email);
    console.log(data)

    Rails.ajax({
        url: '/api/v1/subscribe',
        type: 'POST',
        dataType: 'json',
        data: data,
    })
  }
}
