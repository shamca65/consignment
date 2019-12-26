class ApplicationController < ActionController::Base
include ActionView::Helpers::NumberHelper

  add_flash_types :success, :info, :warning, :error, :savedRecord

  before_action :authenticate_user!, :load_configs

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

  def load_configs
    my_config = Config.select('current_pickup_date').where('slug = "pudate-current" ').first
    $current_pickup_date = my_config.current_pickup_date
    $json_root = '_json'
    $json_id_field = 'id'
  end
end
