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
      when 'xs'
        content_tag(:span, 'x-sm', class: 'badge badge-pill badge-default ')

      when 's'
        content_tag(:span, 'small', class: 'badge badge-pill badge-success ')

      when 'md'
        content_tag(:span, 'med', class: 'badge badge-pill badge-secondary ')

      when 'lg'
        content_tag(:span, 'large', class: 'badge badge-pill badge-danger ')

      when 'xlg'
        content_tag(:span, 'x-lg', class: 'badge badge-pill badge-success ')

      when 'xx'
        content_tag(:span, 'xx-lg', class: 'badge badge-pill badge-success ')

      when 'N/A'
        content_tag(:span, 'N/A', class: 'badge badge-pill badge-info ')
      end
    end
end
