class Admin::OrderHistoriesController < ApplicationController
  
  before_action :authenticate_admin!

  def update
    @order_history = OrderHistory.find(params[:id])
    @order = @order_history.order
    @order_histories = @order.order_histories
    @order_history.update(order_history_params)
    
  if @order_history.status == "製作中"
    @order_history.order.update(status: "製作中")
    
  elsif 
    @order_history.status.all == "製作完了"
    @order_history.order.update(status: "発送準備中")
  end 
  
  
    redirect_to admin_order_path(@order_history.order.id)
  end 

  private

  def order_history_params
    params.require(:order_history).permit(:status)
  end
  
end

