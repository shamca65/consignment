module ApplicationHelper

    def active?(path)
      "active" if current_page?(path)
		end

		def get_customer_records
			@customerRecs = Customer.all
		end
end
