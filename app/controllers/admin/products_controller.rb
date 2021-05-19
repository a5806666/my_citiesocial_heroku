class Admin::ProductsController < Admin::BaseController
    before_action :find_product, only: [:edit, :update, :destroy]

    def index
        @products = Product.all.includes(:vendor)
        @products = Product.page(params[:page]).per(10)
    end
    
    def new
        @product = Product.new
        @product.skus.build
    end

    def create
        @product = Product.new(product_params)

        if @product.save
            redirect_to admin_products_path, notice: '商品を追加しました！'
        else
            render :new
        end
    end

    def edit
        # @product = Product.friendly.find(params[:id])
    end

    def update
        # @product = Product.friendly.find(params[:id])
        if @product.update(product_params)
        redirect_to edit_admin_product_path(@product), notice: '商品を更新しました!!'
        else
            render :edit
        end
    end

    def destroy
        # @product = Product.friendly.find(params[:id])
        @product.destroy
        redirect_to admin_products_path, notice: '商品を削除しました!!'
    end

    private
    def find_product
        @product = Product.friendly.find(params[:id])
    end

    def product_params
        params.require(:product).permit(:name,
                                        :vendor_id,
                                        :list_price,
                                        :sell_price,
                                        :on_sell,
                                        :cover_image,
                                        :category_id,
                                        :description,
                                        skus_attributes: [
                                            :id, :spec, :quantity, :_destroy
                                        ])
    end
end
