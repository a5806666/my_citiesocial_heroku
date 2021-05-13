class Admin::VendorsController < Admin::BaseController
    before_action :find_vendor, only: [:edit, :update, :destroy]

    def index
        @vendors = Vendor.all
    end

    def new
        @vendor = Vendor.new
    end

    def create
        @vendor = Vendor.new(vendor_params)

        if @vendor.save
            redirect_to admin_vendors_path, notice: 'メーカーを追加しました!'
        else
            render :new
        end
    end

    def edit
        # @vendor = Vendor.find(params[:id])
    end

    def update
        # @vendor = Vendor.find(params[:id])
        if @vendor.update(vendor_params)
            redirect_to edit_admin_vendor_path(@vendor), notice: 'メーカーを更新しました!'
        else
            render :edit
        end
    end

    private
    def vendor_params
        params.require(:vendor).permit(:title, :description, :online)
    end

    def find_vendor
        @vendor = Vendor.find(params[:id])
    end
end
