class CartsController < ApplicationController
    before_action :authenticate_user!
    
    def show
    end

    def destroy
        session[:cart_9527] = nil
        redirect_to root_path, notice: 'ショッピングカートが空になりました'
    end

    def checkout
        
    end
end
