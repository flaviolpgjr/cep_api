class AddressesController < ApplicationController
  before_action :authenticate_user

  def get_address
    address = CepApiService.get_address(params[:cep], current_user)
    unless address.blank?
      render json: address
    else
      render json: {}, status: :not_found
    end
  end
end