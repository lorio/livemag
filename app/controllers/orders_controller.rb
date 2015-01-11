class OrdersController < ApplicationController
	before_filter :initialize_cart

	def create
		@order_form = OrderForm.new(
			user: User.new(order_params[:user]),
			cart: @cart
		)

		if @order_form.save
			redirect_to root_path, notice: "Thank you for placing the order."
		else
			render "carts/checkout"
		end
	end

	private

	def order_params
		params.require(:order_form).permit(
			user: [ :name, :address, :city, :country, :postal_code, :phone, :email ]
		)
	end
end