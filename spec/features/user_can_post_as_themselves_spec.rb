# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "User can post as themselves", type: :feature do
  scenario 'successfully' do
    sign_up_successfully
    submit_post_successfully

    expect(page).to have_content("Millie")
  end
end
