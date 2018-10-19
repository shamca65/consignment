# app/controllers/api/v1/customers_controller.rb
module Api
  module V1
    class CustomersController < ApplicationController
      def index
        response = Customer.search params[:q]
        render json: response
      end
      end
    end
  end