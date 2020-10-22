# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome_reset_password_instructions
    UserMailer.welcome_reset_password_instructions(User.first)
  end
end
