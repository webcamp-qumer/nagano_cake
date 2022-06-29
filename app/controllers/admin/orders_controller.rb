class Admin::OrdersController < ApplicationController
  
    before_action :authenticate_admin!

  
  def show 
    @order = Order.find(params[:id])
    @order_histories = OrderHistory.all
    @total = 0 #最初に０を代入
  end
  
  def update
    
    @order = Order.find(params[:id])
    @order.update(order_params)

    if @order.status == "入金確認"
       @order.order_histories.each do |order_history|
        order_history.update(status: "製作待ち")
       end
    elsif 
    end
    redirect_to admin_order_path(@order)
  end 
  
  private

  def order_params
    params.require(:order).permit(:status) 
  end 
end
