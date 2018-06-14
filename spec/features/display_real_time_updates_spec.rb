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
end
