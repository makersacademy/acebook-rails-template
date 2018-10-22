# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'acebookrecipe@gmail.com'
  layout 'mailer'
end
