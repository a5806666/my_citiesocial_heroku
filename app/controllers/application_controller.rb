class ApplicationController < ActionController::Base
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    before_action :find_categories, unless: :backend?

    private
    def record_not_found
        render  file: "#{Rails.root}/public/404.html",
                status: :not_found,
                layout: false 
    end

    def backend?
        controller_path.split('/').first == "Admin"
    end

    def find_categories
        @categories = Category.order(position: :asc)
    end
end
