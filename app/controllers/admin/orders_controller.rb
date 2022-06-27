class Admin::OrdersController < ApplicationController
  
  def show 
    @order = Order.find(params[:id])
    @order_histories = OrderHistory.all
    @total = 0 #最初に０を代入
  end
  
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_path(order)
    else
      render 'show'
    end
  end
  
  private
  
  def order_params
    params.require(:order).permit(:status)
  end
  
end
