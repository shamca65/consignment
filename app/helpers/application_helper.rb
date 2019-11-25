module ApplicationHelper

	def active?(path)
		"active" if current_page?(path)
	end

	def get_customer_records
		@customerRecs = Customer.all
	end

	def simple_date val
		return (val.nil? ? 'Not Set' :  val.strftime("%d-%b-%Y"))
	end

	def simple_txt val
		return val.present? ? val.strip.html_safe : "-"
	end
end