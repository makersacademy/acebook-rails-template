require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can view date post was made" do
    submit_post("Hello, world!")
    expect(page).to have_content(Time.now.to_s(:long_ordinal))
  end
end
