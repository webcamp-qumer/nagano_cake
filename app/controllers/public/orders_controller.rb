class Public::OrdersController < ApplicationController

  def confirm
    @item = Item.find(params[:id])
    @item = public_customer.item
  end

  def create
    @item = Item.new(item_params)
    @item.customer_id = current_user.id
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

  def customer_params
    params.require(:customer).permit(:name, :postcode, :address, :postage , :total_price)
  end
end
