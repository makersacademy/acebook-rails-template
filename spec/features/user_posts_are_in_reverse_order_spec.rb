require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario 'create a post and it appears on the home page' do
    visit "posts#index"
    click_link "New post"
    fill_in "Message", with: "Hello World"
    click_button "Submit"
    click_link "New post"
    fill_in "Message", with: "Wello Horld"
    click_button "Submit"
    expect {"Wello Horld".appears_before("Hello World")}
  end
end
