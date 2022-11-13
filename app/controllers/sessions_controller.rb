class SessionsController < ApplicationController
  def index
  end

  def create
    user = User.find_by(email: params[:email], password: params[:password])
    if user
      if user.email_confirmed
        session[:user_id] = user.id
        unless user.profile.avatar.url
          avatar_list = %w[/assets/1.png /assets/2.png /assets/3.png /assets/4.png /assets/5.png]
          session[:avatar] = avatar_list.sample
        end
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

end
