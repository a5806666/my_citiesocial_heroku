class OrdersController < ApplicationController
    before_action :authenticate_user!

    def index
        @orders = current_user.orders.order(id: :desc)
    end

    def create
        @order = current_user.orders.build(order_params)
        
        current_cart.items.each do |item|
            @order.order_items.build(sku_id: item.sku_id, quantity: item.quantity)
        end

        if @order.save
            # 打API(faraday)
            resp = Faraday.post("#{ENV['line_pay_endpoint']}/v2/payments/request") do |req|
                req.headers['Content-Type'] = 'application/json'
                req.headers['X-LINE-ChannelId'] = ENV['line_pay_channel_id']
                req.headers['X-LINE-ChannelSecret'] = ENV['line_pay_channel_secret']
                req.body = {
                    productName: "注文内容", 
                    amount: current_cart.total_price.to_i, 
                    currency: "TWD",
                    # 本機 
                    # confirmUrl: "http://localhost:3000/orders/confirm",
                    # heroku
                    confirmUrl: "https://serene-harbor-48921.herokuapp.com/orders/confirm",
                    orderId: @order.num
                }.to_json
            end

            result = JSON.parse(resp.body)

            if result["returnCode"] == "0000"
                payment_url = result["info"]["paymentUrl"]["web"]
                redirect_to payment_url
            else
                flash[:notice] = '決済失敗'
                render 'carts/checkout'
            end
        end
    end

    def confirm
        resp = Faraday.post("#{ENV['line_pay_endpoint']}/v2/payments/#{params[:transactionId]}/confirm") do |req|
                req.headers['Content-Type'] = 'application/json'
                req.headers['X-LINE-ChannelId'] = ENV['line_pay_channel_id']
                req.headers['X-LINE-ChannelSecret'] = ENV['line_pay_channel_secret']
                req.body = {
                    amount: current_cart.total_price.to_i, 
                    currency: "TWD", 
                }.to_json
        end

        result = JSON.parse(resp.body)

        if result["returnCode"] = '0000'
            order_id = result["info"]["orderId"]
            transaction_id = result["info"]["transactionId"]

            # 1. 變更 order 狀態
            order = current_user.orders.find_by(num: order_id)
            order.pay!(transaction_id: transaction_id)

            # 2. 清空購物車
            session[:cart_9527] = nil

            redirect_to root_path, notice: '支払いが完了しました'
        else
            redirect_to root_path, notice: '決済失敗'
        end
    end

    def cancel
        @order = current_user.orders.find(params[:id])

        if @order.paid?
            resp = Faraday.post("#{ENV['line_pay_endpoint']}/v2/payments/#{@order.transaction_id}/refund") do |req|
                req.headers['Content-Type'] = 'application/json'
                req.headers['X-LINE-ChannelId'] = ENV['line_pay_channel_id']
                req.headers['X-LINE-ChannelSecret'] = ENV['line_pay_channel_secret']
            end

            result = JSON.parse(resp.body)

            if result["returnCode"] == "0000"
                @order.cancel!
                redirect_to orders_path, notice: "注文番号: #{@order.num} 払い戻しました!"
            else
                redirect_to orders_path, notice: "注文のキャンセル時に、エラーが発生しました"
            end
        else
            @order.cancel!
            redirect_to orders_path, notice: "注文番号: #{@order.num} キャンセルしました!"
        end
    end

    private
    def order_params
        params.require(:order).permit(:recipient, :tel, :address, :note)
    end
end
