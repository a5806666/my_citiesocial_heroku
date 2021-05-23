class Api::V1::UtilsController < ApplicationController
    def subscribe
        email = params["subscribe"]["email"]
        sub = Subscribe.new(email: email)

        if sub.save
            render json: {status: 'ok', email: email }
        else
            render json: {status: 'duplicated', email: email  }
        end
    end

    def cart
        # 找商品
        product = Product.friendly.find(params[:id])
        
        if product
            # cart = Cart.from_hash(session[:cart_9527])

            # ↓application_controller.rb定義的方法取代了上面
            current_cart.add_item(product.code)

            session[:cart_9527] = current_cart.serialize

            render json: { status: 'ok', items: current_cart.items.count }
        end
    end
end
