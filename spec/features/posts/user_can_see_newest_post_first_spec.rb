require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can view newest post first in timeline" do
    log_in_test_user
    submit_post("Hello")
    submit_post("Bye")
    expect(find(".post", match: :first)).to have_content("Bye")
  end
end
