require 'action_text'

class ApplicationController < ActionController::Base
    helper ActionText::Engine.helpers
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    private
    def record_not_found
        render  file: "#{Rails.root}/public/404.html",
                status: :not_found,
                layout: false 
    end
end
