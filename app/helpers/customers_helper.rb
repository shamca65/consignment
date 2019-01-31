module CustomersHelper

    def ag_status_label status
      ag_status_span_generator status
    end

    def size_label size
      size_span_generator size
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

    def size_span_generator size
      case size
      when 0
        content_tag(:span, 'x-sm', class: 'badge badge-pill badge-default ')

      when 1
        content_tag(:span, 'small', class: 'badge badge-pill badge-success ')

      when 2
        content_tag(:span, 'med', class: 'badge badge-pill badge-secondary ')

      when 3
        content_tag(:span, 'large', class: 'badge badge-pill badge-danger ')

      when 4
        content_tag(:span, 'x-lg', class: 'badge badge-pill badge-success ')

      when 5
        content_tag(:span, 'xx-lg', class: 'badge badge-pill badge-success ')

      when 6
        content_tag(:span, 'N/A', class: 'badge badge-pill badge-info ')
      end
    end
end
