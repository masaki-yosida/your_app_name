class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    user_profile = UserProfile.find_by(user_id: current_user.id)
  end
end
