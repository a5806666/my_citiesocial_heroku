import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "quantity" ]

    quantity_minus(event){
        event.preventDefault();
        let value = Number(this.quantityTarget.value);   
        // console.log(value)
        if (value > 1) {
            this.quantityTarget.value = value - 1
        }
    }

    quantity_plus(event){
        event.preventDefault();
        let value = Number(this.quantityTarget.value);  
        // console.log(value)
        this.quantityTarget.value = value + 1
    }

}