module CustomersHelper

    def ag_status_label status
      ag_status_span_generator status
		end

  def customer_full_name
    return (@customer.first_name + ' ' + @customer.last_name)
  end

  private

    def ag_status_span_generator status
      case status
      when 0
        content_tag(:i, '', class: 'far fa-times h2 text-danger')
      when 1
        content_tag(:i, '', class: 'far fa-check-circle h2 text-success')
      end
    end
end
