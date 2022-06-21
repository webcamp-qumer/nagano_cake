class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all

  end
  
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id #ログイン中の会員しか登録できない
    if @address.save
      redirect_to addresses_path(@address)
    else
      @addresses = Address.all
      render :index
    end
  end
  
  
  def edit
    @address = Address.find(params[:id])
    #@customer = @address.customer
  end

  

  def update
  end

  def destroy
  end
  
  private
  
  def address_params
    params.require(:address).permit(:name, :postcode, :address)
  end
  
end
