class Admin::ItemsController < ApplicationController


 def new
  @item = Item.new
 end 
 
 def create
  @item = Item.new(item_params) #ストロングパラメータ
  @item.admin_id = current_user.id #current_user=ログイン中のユーザーの情報を取得できる
  if @item.save
   redirect_to admin_item_path(@item)
  else
   render :new
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
 end 
 
 def update
 end 

private

 def item_params
  params.require(:item).permit(:name, :message, :price_non_tax) #ジャンルと販売ステータスの追加
 end 
 
end
