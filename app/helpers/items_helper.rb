module ItemsHelper

	def size_label size
		size_span_generator size
	end

	def gender_label gender
		gender_span_generator gender
	end
	def type_label type
		type_span_generator type
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

		when 'sm'
			content_tag(:span, 'small', class: 'badge badge-pill badge-success ')

		when 'md'
			content_tag(:span, 'med', class: 'badge badge-pill badge-secondary ')

		when 'lg'
			content_tag(:span, 'large', class: 'badge badge-pill badge-warning ')

		when 'xl'
			content_tag(:span, 'x-lg', class: 'badge badge-pill badge-danger ')

		when 'xx'
			content_tag(:span, 'xx-lg', class: 'badge badge-pill badge-danger ')

		when 'na'
			content_tag(:span, 'N/A', class: 'badge badge-pill badge-info ')
		end
	end


	def gender_span_generator gender
		case gender
		when 'man'
			content_tag(:span, 'Men\'s', class: 'badge badge-pill badge-info  ')

		when 'woman'
			content_tag(:span, 'Woman\'s', class: 'badge badge-pill badge-warning ')

		when 'boy'
			content_tag(:span, 'Boy\'s', class: 'badge badge-pill badge-info ')

		when 'girl'
			content_tag(:span, 'Girl\'s', class: 'badge badge-pill badge-warning ')

		when 'na'
			content_tag(:span, 'N/A', class: 'badge badge-pill badge-danger ')
		end
	end

	def type_span_generator type
		case type
		when 'sht'
			content_tag(:span, 'Shirt', class: 'badge badge-pill badge-secondary ')

		when 'pnt'
			content_tag(:span, 'Pants', class: 'badge badge-pill badge-secondary')

		when 'sho'
			content_tag(:span, 'Shorts', class: 'badge badge-pill badge-secondary ')

		when 'hat'
			content_tag(:span, 'Hat', class: 'badge badge-pill badge-secondary')

		when 'jckt'
			content_tag(:span, 'Jacket', class: 'badge badge-pill badge-secondary ')
		
		when 'skrt'
			content_tag(:span, 'Skirt', class: 'badge badge-pill badge-secondary')
		
		when 'tsht'
			content_tag(:span, 'T-Shirt', class: 'badge badge-pill badge-secondary ')
		
		when 'blse'
			content_tag(:span, 'Blouse', class: 'badge badge-pill badge-secondary ')
		
		when 'acc'
			content_tag(:span, 'Accessory', class: 'badge badge-pill badge-secondary ')
		
		when 'glv'
			content_tag(:span, 'Gloves', class: 'badge badge-pill badge-secondary')
		end
	end
end
