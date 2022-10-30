class UserNotifierMailer < ApplicationMailer
  default :from => ENV['FROM_MAIL']

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    # mail( :to => @user.email,
    #       :subject => 'Thanks for signing up for Meal Pal' )
    mail(:to => "#{@user.first_name} <#{@user.email}>", :subject => "Registration Confirmation")
  end
end
