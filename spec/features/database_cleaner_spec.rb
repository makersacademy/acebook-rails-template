require 'rails_helper'
require_relative '../support/feature_web_helpers'
require_relative '../support/capybara_selectors'

describe "db_cleaner" do
  it "first test" do
    visit "/"
    fill_in_signup_form_and_submit
    expect(User.all.count).to eq(1)
    expect(User.last.id).to eq(1)
  end

  it "should clean db" do
    visit "/"
    fill_in_signup_form_and_submit
    expect(User.all.count).to eq(1)
    expect(User.last.id).to eq(1)
  end
end
