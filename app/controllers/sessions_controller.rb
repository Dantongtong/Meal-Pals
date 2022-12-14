class SessionsController < ApplicationController
  def index
  end

  def create
    user = User.find_by(email: params[:email], password: params[:password])
    if user
      if user.email_confirmed
        session[:user_id] = user.id
        flash[:success] = "Log in successfully!"
        redirect_to root_path
      else
        flash[:notice] = 'Please activate your account by following the
        instructions in the account confirmation email you received to proceed'
        render action: :new
      end
    else
      flash[:error] = "Email or password is incorrect."
      render action: :new
    end
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "Log out successfully!"
    redirect_to root_path
  end

  def slots
    user_id = params[:id]
    @current = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    @slots_owned = Timeslot.where(user_id: user_id).to_a
    @slots_joined = Guest.where(user_id: user_id).to_a
  end

end
