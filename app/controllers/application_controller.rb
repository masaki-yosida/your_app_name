# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

<<<<<<< HEAD

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :avatar, :address, :city, :country, :postal_code, :phone_number, :date_of_birth])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :avatar, :address, :city, :country, :postal_code, :phone_number, :date_of_birth])
  end

  def after_sign_up_path_for(resource)
    # 新しいユーザーが登録されたら、AdditionalUserInfoも作成
    AdditionalUserInfo.create(user: resource)
    super(resource)
  end
end
=======
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
>>>>>>> parent of 510cf65 (デバイスと同じにしない為に消す)
