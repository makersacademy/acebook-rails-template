require 'rails_helper'
require 'support/features/clearance_helpers'

RSpec.feature 'Wall', type: :feature do
  before(:each) do
    sign_in
  end
end
