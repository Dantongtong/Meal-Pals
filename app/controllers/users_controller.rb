class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def index
  end
  def create
    # Create the user from params
    @user = User.new(user_params)
    if @user.save
      # Deliver the signup email
      UserNotifierMailer.send_signup_email(@user).deliver
      flash[:notice] = 'Please confirm your email address to continue'
      redirect_to new_session_path
    else
      render :action => 'new'
    end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Welcome to Meal Pal! Your email has been confirmed.
      Please sign in to continue."
      redirect_to new_session_path
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to new_session_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :username)
  end
end
