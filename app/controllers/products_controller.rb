class ProductsController < ApplicationController
    def index
        @products = Product.order(updated_at: :desc).includes(:vendor)
        @products = Product.where(on_sell: :true)
    end

    def show
        
    end
end
