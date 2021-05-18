class Api::V1::UtilsController < ApplicationController
    def subscribe
        render json: {status: 'oh!email'  }
    end
end
