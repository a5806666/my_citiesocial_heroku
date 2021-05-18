import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = [ "email" ]

  add(event) {
    event.preventDefault();
    let email = this.emailTarget.value.trim();
    // console.log(email)
    let data = new FormData();
    data.append("subscribe[email]", email);
    // console.log(data)

    Rails.ajax({
        url: '/api/v1/subscribe',
        data: data,
        type: 'POST',
        dataType: 'json',
        success: (response) => {
            // console.log(response)
            switch (response.status) {
                case "ok":
                    alert('購読登録をしました!!!');
                    this.emailTarget.value = '';
                    break;
            
                case "duplicated":
                    alert(`${response.email} すでに購読済み!!`);
                    break;
            }
        },
        error: function(err){
            console.log(err);
        }
    })
  }
}
