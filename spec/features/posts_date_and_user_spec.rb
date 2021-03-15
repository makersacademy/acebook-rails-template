# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Posts Date & User', type: :feature do
  it 'should display the time of the post and who wrote it' do
    sign_up
    create_post
    expect(page).to have_content('Hello, world')
    expect(page).to have_content(Time.now.strftime("%m/%d/%Y %I:%M%p"))
    expect(page).to have_content('Test')
  end
end
