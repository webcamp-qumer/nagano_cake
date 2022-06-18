class Public::CustomersController < ApplicationController
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
    if @customer == current_customer
      render :edit
    else
      redirect_to public_customer_path(current_customer.id)
    end
    
  end
  def unsubscribe
    
  end
  
end
