module ApplicationHelper
  def logged_in?
    !!session[:user_id]
  end
  def current_user
    if logged_in?
      @current_user ||= User.find(session[:user_id])
    else
      nil
    end
  end
  def is_admin?
    if logged_in?
      User.find(session[:user_id]).is_admin
    end
    false
  end
end
