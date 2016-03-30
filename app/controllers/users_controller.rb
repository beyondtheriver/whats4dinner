class UsersController < ApplicationController

  def destroy
    @user = current_user
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "Your account was deleted"
    redirect_to '/'
  end

end
