class ProfilesController < ApplicationController
  def index
    @profile = Profile.find_by(user_id: session[:user_id])
  end

  def create
    profile = Profile.find_by(user_id: session[:user_id])
    puts profile_params

    if profile.update!(profile_params)
      flash[:success] = "Update profile successfully!"
      redirect_to profiles_path
    else
      flash[:error] = "Failed to update."
      redirect_to profiles_path
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:avatar, :first_name, :middle_name, :last_name, :gender, :birth, :phone, :preference)
  end
end
