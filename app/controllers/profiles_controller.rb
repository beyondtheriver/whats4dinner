class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def show
    @profile = Profile.where(user_id: params[:id]).first
  end

  def edit
    @profile = get_profile
  end

  def create
    @profile = Profile.create(profile_params)
    current_user
    redirect_to profile_path(current_user)
  end

  def update
    user = current_user
    if user.profile.update(profile_params)
      redirect_to profile_path(current_user), notice: "Profile updated."
    else
      render :new, alert: "There was a problem."
    end
  end

  private

  def get_profile
    current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:f_name, :l_name).merge(user_id: current_user.id)
  end

end
