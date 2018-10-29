# app/controllers/api/v1/customers_controller.rb
module Api
  module V1
    class CustomersController < ApplicationController
      def search
        if params[:term].nil?
          @customers = []
        else
          response = Customer.search params[:term]
          render json: response
        end
      end
    end
  end
end