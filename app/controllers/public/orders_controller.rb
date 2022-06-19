class Public::OrdersController < ApplicationController
  
  def confirm
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
  end
  
  def index
  end
  
  def update
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:name, :postcode, :address, :postage , :total_price)
  end
end
