class Admin::ItemsController < ApplicationController


 def new
  @item = Item.new
 end 
 
 def create
  @item = Item.new(item_params) #ストロングパラメータ
  @item.admin_id = current_admin.id
  @item.save
  redirect_to admin_item_path(@item)
 end 
 
 def index
 end 
 
 def show
 end 
 
 def edit
 end 
 
 def update
 end 

private

 def item_params
  params.require(:item).permit(:name, :message, :price_non_tax) #ジャンルと販売ステータスの追加
 end 
 
end
