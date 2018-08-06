# frozen_string_literal: true
# Apllication Mailer 
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
