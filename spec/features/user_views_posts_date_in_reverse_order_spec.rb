require "rails_helper"
require "date"
require "sign_up_helper"

RSpec::Matchers.define :appear_before do |later_content|
  match do |earlier_content|
    page.body.index(earlier_content) < page.body.index(later_content)
  end
end

RSpec.feature "Posts with dates in reverse order", type: :feature do
  scenario "Can view posts with dates, in order" do
    sign_up
    click_link "New post"
    fill_in "Message", with: "Message 1"
    click_button "Submit"
    click_link "New post"
    fill_in "Message", with: "Message 2"
    click_button "Submit"
    expect("Message 2").to appear_before("Message 1")
  end
end
