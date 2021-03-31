require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  before(:each) do
    @user = User.new(name: "Lizardo", email: "lizard@example.com", password: "123secure", password_confirmation: "123secure")
    @user.save
    sign_in_helper(@user)
  end

  scenario 'create a post and it appears on the home page' do
    visit "posts#index"
    click_button "New post"
    fill_in "post[message]", with: "Hello World"
    click_button "Submit"
    click_button "New post"
    fill_in "post[message]", with: "Wello Horld"
    click_button "Submit"
    expect {"Wello Horld".appears_before("Hello World")}
  end
end
