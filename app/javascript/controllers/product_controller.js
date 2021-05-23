import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
    static targets = [ "quantity", "sku", "addToCartButton" ]

    add_to_cart(event){
        event.preventDefault();
        let product_id = this.data.get("id");
        let quantity = this.quantityTarget.value;
        let sku = this.skuTarget.value;
        console.log(product_id, quantity, sku);
        let data = new FormData();
        data.append("id", product_id);
        data.append("quantity", quantity);
        data.append("sku", sku);
        for (var value of data.values()) {
            console.log(value);
        }   

        // Rails.ajax({
        //     url: "api/hello",
        //     type: 'POST',
        //     data: data,
        //     success: (resp) => {
        //         console.log(resp);
        //     },
        //     error: (err) => {
        //         console.log(err);
        //     }
        // })

        if (quantity > 0) {
            this.addToCartButtonTarget.classList.add('is-loading');
        }
    }

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