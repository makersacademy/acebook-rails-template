require 'rails_helper'


RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view date and time they were submitted' do
    register_user
    visit '/posts'
    creating_post("Afternoon")
    expect(page).to have_content( Time.now.strftime('%d-%m-%y %H:%M:%S'))
  end
end