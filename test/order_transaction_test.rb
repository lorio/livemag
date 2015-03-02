require "test_helper"
class OrderTransactionTest < MiniTest::Test
	include FactoryGirl::Syntax::Methods
	def test_creates_a_transaction
		transaction = OrderTransaction.new order: order, nonce: nonce
		order = Order.new
		order.order_items << OrderItem.new(product: build(:product))
		nonce = Braintree::Test::Nonce::Transactable
		transaction.execute
		assert transaction.ok?, "Expected tr to be successful."
	end
end