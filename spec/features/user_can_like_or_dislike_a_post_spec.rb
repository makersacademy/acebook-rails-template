require 'rails_helper'

RSpec.feature "Comment", type: :feature do
  scenario "User can comment on a post", :vote do
    sign_up_and_sign_in
    make_a_text_post
    find('img.bubble-logo').click
    expect(page).to have_text '1'
  end
end
