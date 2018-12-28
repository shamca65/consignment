module ApplicationHelper

    def active?(path)
      "active" if current_page?(path)
    end

    def size_label size
      size_span_generator size
    end

    def ag_status_label status
      ag_status_span_generator status
    end

    private

    def size_span_generator size
      case size
        when 0
          content_tag(:span, 'XS', class: 'label label-primary')

      when 1
          content_tag(:span, 'S', class: 'label label-success')

        when 2
          content_tag(:span, 'M', class: 'label label-danger')

        when 3
          content_tag(:span, 'L', class: 'label label-primary')

        when 4
          content_tag(:span, 'XL', class: 'label label-success')

        when 5
          content_tag(:span, 'XXL', class: 'label label-success')

        when 6
          content_tag(:span, 'N/A', class: 'label label-success')
        end
    end

    def ag_status_span_generator status
      case status
        when 0
          content_tag(:span, 'Unsigned', class: 'label label-primary')

        when 1
          content_tag(:span, 'Signed', class: 'label label-success')

      end


    end

end
