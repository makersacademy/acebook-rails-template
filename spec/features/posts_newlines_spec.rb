require 'rails_helper'

RSpec.feature "New lines in posts", type: :feature do
  scenario "A post can have newlines in it, and this will be reflected in the output" do
    visit '/'
    click_link("Sign up", match: :first)
    fill_in "user_email", with: "featuretest@email.com"
    fill_in "user_first_name", with: 'feature'
    fill_in "user_last_name", with: 'test'
    fill_in "user_password", with: "featurepwd"
    fill_in 'user_password_confirmation', with: "featurepwd"
    click_on "Submit"
    expect(page).to have_content('Logged in')
    click_link("New post")
    expect(page).to have_content('Message')
    fill_in "post_message", with: "Feature testing newlines in this box. \n This post should have new lines after every sentence. \n This sentence and the following should be separated by two newlines. \n \n There should be more space above this."
    click_on "Submit"
    expect(page.html).to include("<br /> This post should have new lines after every sentence.")
    expect(page.html).to include("<br /> This sentence and the following")
  end
end
