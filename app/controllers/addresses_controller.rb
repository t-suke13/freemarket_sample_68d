class AddressesController < ApplicationController
  before_action :set_address
  
  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :address1, :address2, :building_name, :phone_number, :prefecture_id).merge(user_id: current_user.id)
  end

  def set_address
    @address = Address.find_by(user_id: current_user.id)
  end
end
