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
      @address = Address.find(params[:address_id][:order])
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
    @item = Order.new(order_params)
    @item.customer_id = current_customer.id
    @item.save
      redirect_to thanks_path
  end

  def show
    @order = Order.find(params[:id])
    new_history = @order.order_histories.new
    new_history.customer_id = current_user.id
    new_history.save
  end

  def index
    @order_histories = OrderHistory.all
    @total = 0
  end

  def update
  end

  private

  def order_params
    params.require(:order).permit(:name, :postcode, :address, :postage , :total_price, :pay_methodz)
  end
end
