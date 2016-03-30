class UsersController < ApplicationController

	def create

	end

	def update

	end

	def show

	end

	

  def destroy
    @user = current_user
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "Your account was deleted"
    redirect_to '/'
  end

end
