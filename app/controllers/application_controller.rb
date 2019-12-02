class ApplicationController < ActionController::Base
include ActionView::Helpers::NumberHelper

  add_flash_types :success, :info, :warning, :error, :savedRecord
  add_breadcrumb "home", :root_path

  before_action :authenticate_user!

  layout :layout_by_resource

  # exclude navbar & other stuff brought in by application.html.erb
  #
  def layout_by_resource
    if devise_controller?
      "application"
    else
      "application"
    end
  end

end
