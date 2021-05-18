import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "template", "link" ]

  add_sku(event) {
    event.preventDefault();

    let content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime());
    // console.log(content)
    this.linkTarget.insertAdjacentHTML('beforebegin', content);
  }
  remove_sku(event) {
    event.preventDefault();
    // console.log('remove')
    let wrapper = event.target.closest('.nested-fields')
    // console.log(wrapper)
    if (wrapper.dataset.newRecord == 'true') {
      wrapper.remove();
    } else {
      wrapper.querySelector("input[name*='_destroy']").value = 1;
      wrapper.style.display = 'none'
    }
  }
}
