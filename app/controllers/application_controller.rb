# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :avatar, :address, :city, :country, :postal_code, :phone_number, :date_of_birth])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :avatar, :address, :city, :country, :postal_code, :phone_number, :date_of_birth])
  end

  def new
    super
  end
end