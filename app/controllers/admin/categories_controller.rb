class Admin::CategoriesController < Admin::BaseController
    before_action :category_find, only: [:edit, :update, :destroy]

    def index
        @categories = Category.all.order(position: :asc)
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)

        if @category.save
            redirect_to admin_categories_path, notice: 'ジャンルを追加しました！'
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @category.update(category_params)
            redirect_to edit_admin_category_path(@category), notice: 'ジャンルを更新しました！'
        else
            render :edit
        end
    end

    def destroy
        # @category = Category.find(params[:id])
        @category.destroy
        redirect_to admin_categories_path, notice: 'ジャンルを削除しました!!'
    end

    private
    def category_params
        params.require(:category).permit(:name)
    end

    def category_find
        @category = Category.find(params[:id])
    end
end
