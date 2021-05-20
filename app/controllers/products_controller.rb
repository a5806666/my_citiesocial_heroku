class ProductsController < ApplicationController
    def index
        @products = Product.order(updated_at: :desc).includes(:vendor)
        @products = Product.where(on_sell: :true)
    end

    def show
        @product = Product.friendly.find(params[:id])
    end

    def search
        if params[:name].present?
          @products = Product.where('name LIKE ?', "%#{params[:name]}%")
        else
          @products = Product.none
        end
    end
end
