class Admin::OrdersController < ApplicationController
  
  def show 
    @order = order.find(params[:id])
    @order_histories = OrderHistory.all
  end
  
  
end
