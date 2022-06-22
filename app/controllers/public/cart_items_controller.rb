class Public::CartItemsController < ApplicationController

  def index
    @items = Item.all
    @cart_items = current_customer.cart_items.all
    # カートに入ってる商品の合計金額
    @total = @cart_items.inject(0) { |sum, item| sum + item.total_price }
  end

  def create
    @item = CartItem.new(cart_item_params)
    #@item.customer_id = current_user.id
    if @item.save
      redirect_to cart_items_path
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
    Item.destroy_all
    redirect_to cart_item_path
  end

  private


  def cart_item_params
      params.require(:cart_item).permit(:item_id, :customer_id, :quantity)
  end

  def item_params
    params.require(:item).permit(:name, :amount)
  end

end
