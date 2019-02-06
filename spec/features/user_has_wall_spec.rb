require 'rails_helper'
require_relative '../helpers/users_helper_spec'

RSpec.feature 'Visit own wall', type: :feature do
  scenario 'User redirected to wall after sign_up' do
    visit '/'
    sign_up
    expect(page.current_path).to eq('/users/davethecat@katze.com')
  end
end
