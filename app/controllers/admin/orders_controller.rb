class Admin::OrdersController < ApplicationController
  
    before_action :authenticate_admin!

  
  def show 
    @order = Order.find(params[:id])
    @order_histories = @order.order_histories
    @total = 0 #最初に０を代入
  end
  
  def update
    
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_histories = @order.order_histories

    if @order.status == "入金確認"
      @order_histories.each do |order_history|
        order_history.status = "製作待ち"
        order_history.save
      end
    end
    redirect_to admin_order_path(@order)
  end 
  
  private

  def order_params
    params.require(:order).permit(:status) 
  end 
end
