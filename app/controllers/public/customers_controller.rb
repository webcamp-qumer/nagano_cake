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
  
  def update
   @customer = Customer.find(params[:id])
   @customer = @customer.update(public_customer_params)
   redirect_to public_customer_path(current_customer.id)
    
  end
  
  def unsubscribe
    
  end
  
  private
  
  def public_customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email)
    
  end
  
end
