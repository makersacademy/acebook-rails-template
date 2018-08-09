require 'simplecov'

SimpleCov.start do
  add_filter "app/channels/application_cable/connection.rb"
  add_filter "app/channels/application_cable/channel.rb"
  add_filter "app/jobs/application_job.rb"
  add_filter "app/mailers/application_mailer.rb"
end
