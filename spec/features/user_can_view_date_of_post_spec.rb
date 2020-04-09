require 'rails_helper'
require_relative '../support/helpers.rb'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view the date they were posted' do
    addPost("Hello, world!")
    date = Date.today
    expect(page).to have_content("Hello, world! #{date}")
  end
end
