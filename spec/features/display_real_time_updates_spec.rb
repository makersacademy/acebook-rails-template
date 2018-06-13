require 'rails_helper'

RSpec.feature "Notifications", type: :feature do
  scenario "Displays the author and time of the newly created post" do
    Time.zone = 'London'
    new_time = Time.local(2016, 6, 10, 12, 0, 0).strftime("%e %B %Y %H:%M")
    Timecop.freeze(new_time)
    sign_up_and_sign_in
    make_a_text_post
    expect(page).to have_css("li", text: "#{new_time} Clint (GoldFish) created a post")
  end

  scenario "Displays the time of the edited post" do
    Time.zone = 'London'
    new_time = Time.local(2016, 6, 10, 12, 0, 0).strftime("%e %B %Y %H:%M")
    Timecop.freeze(new_time)
    sign_up_and_sign_in
    make_a_text_post
    first('.item').click_link('Edit')
    fill_in "Message", with: "!"
    click_button "Update"
    expect(page).to have_content("#{new_time} Clint (GoldFish) edited a post")
  end

  scenario "Displays the time of the deleted post" do
    Time.zone = 'London'
    new_time = Time.local(2016, 6, 10, 12, 0, 0).strftime("%e %B %Y %H:%M")
    Timecop.freeze(new_time)
    sign_up_and_sign_in
    make_a_text_post
    first('.item').click_link('Delete')
    expect(page).to have_content("#{new_time} post was deleted")
  end



end
