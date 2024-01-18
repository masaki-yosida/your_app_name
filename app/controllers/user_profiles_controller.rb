# app/controllers/user_profiles_controller.rb

class UserProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_profile, only: [:edit, :update]

  def edit
  end

  def new
    @user_profile = UserProfile.new
  end

  def update
    if @user_profile.update(user_profile_params)
      redirect_to root_path, notice: 'User profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user_profile
    @user_profile = current_user.user_profile || current_user.build_user_profile
  end

  def user_profile_params
    params.require(:user_profile).permit(:address, :city, :country, :postal_code, :phone_number, :avatar, :gender)
  end
end
