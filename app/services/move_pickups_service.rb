class MovePickupsService

	def initialize(param)
		@param1 = param
	end

	def call
		move_to_store_stock
	end

	private
	attr_reader :param

	def move_to_store_stock
		# loop through ids & update fields
		#things = do_something(param1)
		puts "param : " + param.to_s

	end

			#rescue SomeSpecificException => exception
			#	OpenStruct(success?: false, things: nil, error: exception.message)
			#else
			#	OpenStruct(success?: true, things: thingserror: nil)
			#end

end