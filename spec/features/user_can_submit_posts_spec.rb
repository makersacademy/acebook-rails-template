require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    sign_up
    add_post
    expect(page).to have_content("Hello, world!")
  end
  scenario "Can post and view time" do
    allow(Time).to receive(:now).and_return(Time.mktime(0))
    dateString = Time.now.strftime("%a %e %b %H:%M")
    sign_up
    add_post
    expect(page).to have_content(dateString)
  end
  scenario "posts are viewed in ascending age" do
    sign_up
    add_post("I am post 1")
    add_post("I am post 2")
    add_post("I am post 3")
    alltext = page.body
    i1 = alltext.index('I am post 1')
    i2 = alltext.index('I am post 2')
    i3 = alltext.index('I am post 3')
    expect(i3 < i2).to eq true
    expect(i2 < i1).to eq true
  end
end
