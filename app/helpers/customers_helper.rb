module CustomersHelper

    def ag_status_label status
      ag_status_span_generator status
    end

	private

    def ag_status_span_generator status
      case status
      when 0
        content_tag(:i, '', class: 'far fa-times h4 text-danger')

      when 1
        content_tag(:i, '', class: 'far fa-check-circle h4 text-success')

      end

    end
end
