class Public::OrdersController < ApplicationController

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @total = 0
    if
      params[:order][:address_select] == "1"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name+current_customer.first_name

    elsif
      params[:order][:address_select] == "2"
      @address = Address.find(params[:order][:address_id])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @address.name

    elsif
      params[:order][:address_select] == "3"
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end

  def new
    @order = Order.new
    @address = Address.all
    @address_customer = current_customer
  end

  def create
    @order = Order.new(order_params)
    # @order.total_price
    @order.postage = 800
    @order.customer_id = current_customer.id

    if @order.save!
      @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
        order_history = OrderHistory.new
        order_history.price_non_tax = cart_item.item.price_non_tax
        order_history.quantity = cart_item.quantity
        order_history.order_id = @order.id
        order_history.item_id = cart_item.item_id
        order_history.status = 0
        order_history.save!
        cart_item.destroy
      end
      redirect_to thanks_path
    end
  end

  def show
    @order_histories = OrderHistory.all
    @order = Order.find(params[:id])
    @orders = @order.order_histories
    new_history = @order.order_histories.new
    new_history.order.customer_id = current_customer.id
    new_history.save
  end

  def index
    @orders = current_customer.orders
    @total = 0
  end

  def update
  end

  private


 def order_params
    params.require(:order).permit(:name, :postcode, :address, :postage , :total_price, :pay_method)
 end

end
