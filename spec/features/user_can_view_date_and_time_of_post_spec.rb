require 'rails_helper'
require 'test_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can view date and time of post" do
    sign_up
    new_post
    now = DateTime.now

    expect(page).to have_content(now.strftime("%C%y-%m-%d %H:%M:%S"))
  end
end
