class Public::OrdersController < ApplicationController

  def confirm
    @item = Item.find(params[:id])
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
  end

  def new
    @address = Address.all
    @address_costomer = current_customer
  end

  def create
    @item = Item.new(item_params)
    @item.customer_id = current_costomer.id
    if @item.save
      redirect_to thanks
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
  end

  def update
    @item = Item.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:name, :postcode, :address, :postage , :total_price, :pay_method)
  end
end
