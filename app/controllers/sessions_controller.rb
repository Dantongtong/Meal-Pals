class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = "Sign in successfully!"
      redirect_to root_path
    else
      flash[:notice] = "Email or password is incorrect."
      render action: :new
    end
  end
end
