# frozen_string_literal: true

# Would let us send emails, unsure if this is currently being used.
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
