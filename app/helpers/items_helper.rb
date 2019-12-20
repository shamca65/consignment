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

	def status_label item_status
		status_span_generator item_status
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
			content_tag(:span, 'x-sm', class: 'badge  badge-default ')

		when 'sm'
			content_tag(:span, 'small', class: 'badge  badge-success ')

		when 'md'
			content_tag(:span, 'med', class: 'badge  badge-secondary ')

		when 'lg'
			content_tag(:span, 'large', class: 'badge  badge-warning ')

		when 'xl'
			content_tag(:span, 'x-lg', class: 'badge  badge-danger ')

		when 'xx'
			content_tag(:span, 'xx-lg', class: 'badge  badge-danger ')

		when 'na'
			content_tag(:span, 'N/A', class: 'badge  badge-info ')
		end
	end


	def gender_span_generator gender
		case gender
		when 'man'
			content_tag(:span, 'Men\'s', class: 'badge  badge-info  ')

		when 'woman'
			content_tag(:span, 'Woman\'s', class: 'badge  badge-warning ')

		when 'boy'
			content_tag(:span, 'Boy\'s', class: 'badge  badge-info ')

		when 'girl'
			content_tag(:span, 'Girl\'s', class: 'badge  badge-warning ')

		when 'na'
			content_tag(:span, 'N/A', class: 'badge  badge-secondary ')
		end
	end

	def type_span_generator type
		case type
		when 'sht'
			content_tag(:span, 'Shirt', class: 'badge  badge-secondary ')

		when 'pnt'
			content_tag(:span, 'Pants', class: 'badge  badge-secondary')

		when 'sho'
			content_tag(:span, 'Shorts', class: 'badge  badge-secondary ')

		when 'hat'
			content_tag(:span, 'Hat', class: 'badge  badge-secondary')

		when 'jckt'
			content_tag(:span, 'Jacket', class: 'badge  badge-secondary ')
		
		when 'skrt'
			content_tag(:span, 'Skirt', class: 'badge  badge-secondary')
		
		when 'tsht'
			content_tag(:span, 'T-Shirt', class: 'badge  badge-secondary ')
		
		when 'blse'
			content_tag(:span, 'Blouse', class: 'badge  badge-secondary ')
		
		when 'acc'
			content_tag(:span, 'Accessory', class: 'badge  badge-secondary ')
		
		when 'glv'
			content_tag(:span, 'Gloves', class: 'badge  badge-secondary')
		end
	end


	def status_span_generator item_status
		case item_status
			
		when 'fs'
			content_tag(:span, 'For Sale', class: 'badge  badge-primary  ')

		when 'sold'
			content_tag(:span, 'Sold', class: 'badge  badge-warning ')

		when 'mtd'
			content_tag(:span, 'Donated', class: 'badge  badge-secondary ')
		
		when 'po'
			content_tag(:span, 'Paid Out', class: 'badge  badge-success ')
		
		when 'rtc'
			content_tag(:span, 'Rtn to Cust.', class: 'badge  badge-danger ')
		end
	end

end
