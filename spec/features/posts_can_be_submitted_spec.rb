require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    user_signup('arakno', 'dan@makers.com', 'Arabella Knowles', 'makers4L')
    create_post('Hello, world!')
    date_time = Time.new.strftime("%-d/%-m/%-y %H:%M")
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content(date_time)
  end

  scenario "users see posts in reverse chronological order" do 
    user_signup('arakno', 'dan@makers.com', 'Arabella Knowles', 'makers4L')
    create_post("I should see this message second because I submitted this one before the next one")
    create_post("I should see this message first because I submitted this one more recently than the last one")
    expect("I should see this message first because I submitted this one more recently than the last one").to appear_before("I should see this message second because I submitted this one before the next one")
  end
end
