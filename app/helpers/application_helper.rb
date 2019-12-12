module ApplicationHelper

		def active?(path)
			"active" if current_page?(path)
		end

		def simple_date val
			return (val.nil? ? 'Not Set' :  val.strftime("%d-%b-%Y"))
		end

		def simple_txt val
			return val.present? ? val.strip.html_safe : "-"
		end

		def customer_id_badge val
			content_tag(:span, val.to_s.html_safe , class: 'badge badge-rect badge-danger')
		end

		def item_id_badge val
			content_tag(:span, val.to_s.html_safe , class: 'badge badge-rect badge-primary')
		end

		def get_current_pickup_date
			simple_date($current_pickup_date).present? ? simple_date($current_pickup_date) : "not set"
		end

		def pickup_date_expired
			$current_pickup_date < Date.today
		end

	end