class UsersController < ApplicationController
  def show
    @user = current_user # or whatever logic you use to get the user
    respond_to do |format|
      format.html
    end
  end
  
end
