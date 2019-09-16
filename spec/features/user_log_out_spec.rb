require 'rails_helper'
require 'clearance_helpers'

RSpec.feature 'Timeline', type: :feature do
  
  before do
    sign_up_with('username', 'test@mail.com', 'testing')
  end

end