class Public::OrdersController < ApplicationController

  def confirm
    
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    
    if params[:order][:address] == 'address'
      @order.postcode = current_costomer.postcode
      @order.address = current_costomer.address
      @order.name = current_costomer.last_name + current_costomer.first_name
    elsif params[:order][:address] == 'index'
      @address = Address.find(params[:address_id][:order])
      @order.postcode = @address. postcode
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address] == 'create'
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.name = params[:order][:last_name] + params[:order][:first_name]
    end  
  end

  def new
    @address = Address.all
    @address_costomer = current_customer
  end

  def create
    @item = Item.new(item_params)
    @item.customer_id = current_costomer.id
    if @item.save
      redirect_to thanks_path
    else
      @items = Item.all
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
    new_history = @order.order_histories.new
    new_history.customer_id = current_user.id
    new_history.save
  end

  def index
    #@order = order.find(params[:id])
    @order_histories = OrderHistory
    @total = @cart_items.inject(0) { |sum, item| sum + item.total_price }
  end

  def update
    @item = Item.find(params[:id])
  end

  private

  def order_params
    params.permit(:name, :postcode, :address, :postage , :total_price, :pay_method)
  end
end
