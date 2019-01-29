class MovePickupsService

	def initialize(param)
		@param = param
	end

	def call
		move_to_store_stock
	end

	private
	attr_reader :param

	def move_to_store_stock
		# loop through ids & update fields
		#things = do_something(param1)
		Item.where(:id =>param).update_all(owner: 'store', item_status: 'mtd')
	end

end