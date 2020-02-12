class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordInvalid, with :email_invalid


  private

  def email_invalid(error)
    redirect_to(root_path, :notice => 'Congratulations You Have Signed Up to AceBook')
  end
end
