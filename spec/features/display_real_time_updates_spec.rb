require 'rails_helper'

RSpec.feature "Notifications", type: :feature do
  scenario "User can see real time updates of all other posts ", :comment do
    sign_up_and_sign_in
    make_a_text_post
    expect(page).to have_content('Post was created')
  end
end
