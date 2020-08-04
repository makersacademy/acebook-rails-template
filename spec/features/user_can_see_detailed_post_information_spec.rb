require 'rails_helper'


RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view date and time they were submitted' do
    register_user
    visit '/posts'
    creating_post("Afternoon")
    expect(page).to have_content( Time.now.strftime('%d-%m-%y %H:%M:%S'))
  end
  scenario 'Can see who created each post that the user is viewing' do
    register_user
    visit '/posts'
    creating_post("Afternoon")
    expect(page).to have_content( 'test@test.com' )
  end

  it "should show the newest post first" do
    register_user
    creating_post("First Post")
    creating_post("Second Post")

    within first('div.posts') do
      expect(all('p').first.text).to eq 'Second Post'
    end
  end
end