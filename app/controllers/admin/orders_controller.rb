class Admin::OrdersController < ApplicationController
  
  def show 
    @order = Order.find(params[:id])
    @order_histories = OrderHistory.all
    @total = 0 #最初に０を代入
  end
  
  
end
