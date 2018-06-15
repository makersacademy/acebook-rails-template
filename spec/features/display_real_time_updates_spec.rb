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

  scenario "Displays the assigned image on notifications" do
    sign_up_and_sign_in
    make_a_text_post
    expect(page).to have_css("img[src*='fishbook-logo-92cf2ed604b5404dc11f3199e3747b76d236e34ec63bd04659217ced51b49312.png']")
  end

  scenario "Displays the author and time of the liked post" do
    Time.zone = 'London'
    new_time = Time.local(2016, 6, 10, 12, 0, 0).strftime("%e %B %Y %H:%M")
    Timecop.freeze(new_time)
    sign_up_and_sign_in
    make_a_text_post
    find(:xpath, "//a/img[@alt='Buuble']/..").click
    find('img#notification-icon').click
    page.find("li", text: "#{new_time} Clint (GoldFish) liked a post")
  end

  scenario "Displays the author and time of the disliked post" do
    Time.zone = 'London'
    new_time = Time.local(2016, 6, 10, 12, 0, 0).strftime("%e %B %Y %H:%M")
    Timecop.freeze(new_time)
    sign_up_and_sign_in
    make_a_text_post
    find(:xpath, "//a/img[@alt='Anchor']/..").click
    find('img#notification-icon').click
    page.find("li", text: "#{new_time} Clint (GoldFish) disliked a post")
  end

  scenario "Displays the author and time of the unliked post" do
    Time.zone = 'London'
    new_time = Time.local(2016, 6, 10, 12, 0, 0).strftime("%e %B %Y %H:%M")
    Timecop.freeze(new_time)
    sign_up_and_sign_in
    make_a_text_post
    find(:xpath, "//a/img[@alt='Buuble']/..").click
    find(:xpath, "//a/img[@alt='Buuble']/..").click
    find('img#notification-icon').click
    page.find("li", text: "#{new_time} Clint (GoldFish) unliked a post")
  end

  scenario "Displays the author and time of the undisliked post" do
    Time.zone = 'London'
    new_time = Time.local(2016, 6, 10, 12, 0, 0).strftime("%e %B %Y %H:%M")
    Timecop.freeze(new_time)
    sign_up_and_sign_in
    make_a_text_post
    find(:xpath, "//a/img[@alt='Anchor']/..").click
    find(:xpath, "//a/img[@alt='Anchor']/..").click
    find('img#notification-icon').click
    page.find("li", text: "#{new_time} Clint (GoldFish) undisliked a post")
  end

  scenario "Displays the author and time of a comment" do
    Time.zone = 'London'
    new_time = Time.local(2016, 6, 10, 12, 0, 0).strftime("%e %B %Y %H:%M")
    Timecop.freeze(new_time)
    sign_up_and_sign_in
    make_a_text_post
    fill_in "comment_content", with: 'This is a comment!'
    click_button "Comment"
    page.find("li", text: "#{new_time} Clint (GoldFish) made a comment")
  end
end
