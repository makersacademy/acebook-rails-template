require "helpers/authentication_helper"
require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  scenario "comment on someone elses post" do
    generate_fake_users()
    click_link "PaulKane12"
  end

end
