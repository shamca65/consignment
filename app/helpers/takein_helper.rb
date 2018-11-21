module TakeinHelper
  def takein(customer)

    3.times { customer.items.build }

    customer
  end
end