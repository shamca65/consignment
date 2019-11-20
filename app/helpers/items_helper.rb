module ItemsHelper

	def size_label size
		size_span_generator size
	end

	def days_in_store takein_date
		if takein_date.present?
			return (Date.today.to_date - takein_date.to_date).to_i
		else
			return takein_date.to_date
		end
	end

	def customer_list
		return options_from_collection_for_select(Customer.all, :id, :first_name)
	end

	private

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
