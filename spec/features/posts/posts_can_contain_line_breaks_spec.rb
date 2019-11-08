require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Posts can contain line breaks" do
    log_in_test_user
    submit_post("My post\ncontains line breaks")
    expect(page).to_not have_content 'My post\ncontains line breaks'
    expect(page).to have_content "My post\ncontains line breaks"
  end
end
