class Public::CartItemsController < ApplicationController
  
  def index
    @items = Item.all
    @item = current_customer
  end

  def create
    @item = Item.new(item_params)
    @item.customer_id = current_user.id
    if @item.save
      redirect_to new_order_path
    else
      @items = Item.all
      render :index
    end
  end

  def update
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
  end

  def destroy_all
    @item.destroy_all
  end

  private

  def customer_params
    params.require(:item).permit(:name, :amount)
  end

end
