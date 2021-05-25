class OrdersController < ApplicationController
    before_action :authenticate_user!

    def create
        @order = current_user.orders.build(order_params)
        current_cart.items.each do |item|
            @order.order_items.build(sku: 0, quantity: item.quantity)
        end

        if @order.save
            redirect_to root_path, notice: '支払いが完了しました'
        else
            render 'carts/checkout'
        end
    end

    private
    def order_params
        params.require(:order).permit(:recipient, :tel, :address, :note)
    end
end
