class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
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
