module ApplicationHelper

    def active?(path)
      "active" if current_page?(path)
    end

    def size_label size
      size_span_generator size
    end

    private

    def size_span_generator size
      case size
        when 0
          content_tag(:span, 'XS', class: 'badge badge-default h2')

      when 1
          content_tag(:span, 'S', class: 'badge badge-success h2')

        when 2
          content_tag(:span, 'M', class: 'badge badge-secondary h2')

        when 3
          content_tag(:span, 'L', class: 'badge badge-danger h2')

        when 4
          content_tag(:span, 'XL', class: 'badge badge-success h2')

        when 5
          content_tag(:span, 'XXL', class: 'badge badge-success h2')

        when 6
          content_tag(:span, 'N/A', class: 'badge badge-info h2')
        end
    end


end
