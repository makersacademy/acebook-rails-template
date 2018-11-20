require 'simplecov'
require 'simplecov-console'
require 'coveralls'
Coveralls.wear!


module ApiControllerHelper
  # def stub_access_token(token)
  #   allow_any_instance_of(ApplicationController).to receive(:doorkeeper_token).and_return(token)
  # end

  def stub_current_user(user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end
end



RSpec.configure do |config|
  config.include ApiControllerHelper
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start
