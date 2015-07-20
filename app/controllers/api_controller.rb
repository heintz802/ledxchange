class ApiController < ApplicationController
  respond_to :json

  private
    def render_success extra={}
      render json: extra
    end

    def render_error extra={}
      render json: extra, status: :unprocessable_entity
    end

    def render_error_with_full_messages entity=nil
      if entity.nil?
        render json: {}, status: :unprocessable_entity
      else
        render json: entity.errors.full_messages, status: :unprocessable_entity
      end
    end
end
