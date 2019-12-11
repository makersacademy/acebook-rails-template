require 'rails_helper'

RSpec.feature "Post", type: :feature do
  scenario "User can view only their posts when on Posts" do
    sign_up_user
    make_post("Beep beep")

    visit 'posts/id'

    expect(page).to have_content('Beep beep')
  end
end
