class UserMailer < ApplicationMailer
  default from: 'robot.lizard2020@yahoo.com'

  def welcome_email
    @user = params[:user] #where this coming from?
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to FAECES BOOK')
  end
end
