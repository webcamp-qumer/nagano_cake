class Admin::ItemsController < ApplicationController

  before_action :authenticate_admin!


 def new
  @item = Item.new
  @genres = Genre.all
 end 
 
 def create
  @item = Item.new(item_params) #ストロングパラメータ
  if @item.save
   redirect_to admin_item_path(@item)
  else
   render 'new'
  end 
  
 end 
 
 def index
  @items = Item.all
 end 
 
 def show
  @item = Item.find(params[:id])
 end 
 
 def edit
  @item = Item.find(params[:id])
  @genres = Genre.all
 end 
 
 def update
  @item = Item.find(params[:id])
  @item.update(item_params) #ストロングパラメータ！！
  redirect_to admin_item_path(@item)
 end 
 
 def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admin_items_path
 end 

private

 def item_params
  params.require(:item).permit(:image,:name, :message, :price_non_tax, :is_active, :genre_id) 
 end 
 
end
