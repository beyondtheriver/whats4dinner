class UsersController < ApplicationController

	def create

	end

	def update

	end

	def show

	end



  def destroy

    if current_user.destroy

      flash[:notice] = "Your account was deleted"
      sign_out_and_redirect current_user
    end
  end

end
