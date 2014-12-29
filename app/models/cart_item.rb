class CartItem
	attr_reader :product_id, :quantity

	def initialize product_id, quantity = 1
		@product_id = product_id
		@qantity = quantity
	end

	def increment
		@quantity = @quantity + 1
	end

	def product
		Product.find product_id
	end
end
