class Public::CartItemsController < ApplicationController

  def index
    @items = Item.all
    @cart_items = current_customer.cart_items.all
    # カートに入ってる商品の合計金額
    #@total = 0
    @total = @cart_items.inject(0) { |sum, item| sum + item.total_price }
  end

  def create
    @item = CartItem.new(cart_item_params)
    if @item.save
      redirect_to cart_items_path
    else
      @items = Item.all
      render :index
    end
  end

  def update
    @item = CartItem.find(params[:id])
    @item = @item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  private


  def cart_item_params
      params.require(:cart_item).permit(:item_id, :customer_id, :quantity)
  end

  def item_params
    params.require(:item).permit(:name, :quantity)
  end

end
