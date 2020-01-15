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
  # TODO fix tax rate b
  def load_configs
    pud_config = Config.select('date').where('slug = "pudate-current" ').first
    $current_pickup_date = pud_config.date
    # should be enter as a whole number (e.g. 13) which is then converted to a
    # decimal (.13)
    tra_config = Config.select('value', 'name').where('slug = "tax-rate-a" ').first
    tmp_tax_a = tra_config.value.to_f ||= 0
    if tmp_tax_a > 1
      $tax_rate_a = (tmp_tax_a/100)
      puts("tax_rate_a : " + $tax_rate_a.to_s)
    end
    $tax_rate_a_name = tra_config.name ||= 'Tax A'

    trb_config = Config.select('value','name').where('slug = "tax-rate-b" ').first
    #$tax_rate_b = trb_config.value.to_f ||= 0
    $tax_rate_b_name = 'Tax Rate Bee'

    $json_root ||= '_json'
    $json_id_field ||= 'id'
    $cash_clerk ||= 'cash_clerk'
    $takein_clerk ||= 'takein_clerk'
  end
end
