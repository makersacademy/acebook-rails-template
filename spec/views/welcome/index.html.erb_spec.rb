require 'rails_helper'

# RSpec.describe "welcome/index.html.erb", type: :view do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

# describe Signup do
#   it 'has a welcome message' do
#     expect(page).to
#   end
# end

RSpec.feature 'Welcome', type: :feature do
  scenario 'Can see the welcome message' do
    visit '/welcome/index'
    expect(page).to have_content('Welcome to Acebook!')
  end
end
