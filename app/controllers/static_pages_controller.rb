class StaticPagesController < ApplicationController
  def home
   if current_user && !current_user.profile
         redirect_to new_profile_path
   end
  end

  def contact
  end
end
