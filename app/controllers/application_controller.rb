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
    pud_config = Config.select('date').where('slug = "pudate-current" ').first
    $current_pickup_date = pud_config.date
    tr_config = Config.select('value').where('slug = "tax-rate" ').first
    $tax_rate01 = tr_config.value.to_f
    $json_root ||= '_json'
    $json_id_field ||= 'id'
    $cash_clerk ||= 'cash_clerk'
    $takein_clerk ||= 'takein_clerk'
  end
end
