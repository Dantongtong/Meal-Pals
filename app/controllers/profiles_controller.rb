class ProfilesController < ApplicationController
  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    profile = Profile.find(params[:id])
    if profile.update(profile_params)
      flash[:success] = "Update profile successfully!"
      redirect_to edit_profile_path(profile.id)
    else
      flash[:error] = "Failed to update, " + profile.errors.full_messages.first.to_s
      redirect_to edit_profile_path(profile.id)
    end
  end

  def slots
    @slots_owned = Timeslot.where(user_id: session[:user_id]).to_a
    puts @slots_owned
    @slots_joined = Guest.where(user_id: session[:user_id]).to_a
  end

  private
  def profile_params
    params.require(:profile).permit(:avatar, :first_name, :middle_name, :last_name, :gender, :birth, :phone, :preference)
  end
end
