require 'rails_helper'

RSpec.feature "Delete a post", type: :feature do
  scenario "A user can delete a post" do
    login_george_manyposts
    expect(page.html).to include("This post will be deleted")
    click_link("Destroy", match: :first)
    expect(page.html).not_to include("This post will be deleted")
  end

  scenario "I can not destroy a post that is not mine" do
    login_percy_onepost
    expect(page.html).to include("A medium length post of a single sentence of an average length. Number 7")
    click_link("Destroy", match: :first)
    expect(page.html).to include("A medium length post of a single sentence of an average length. Number 7")
  end

  scenario "It can destroy a post with likes, destroying the likes" do
    login_george_manyposts
    expect(page).to have_content("This post will be deleted")
    click_on("Like", match: :first)
    expect(page).to have_content("1 Like")
    click_link("Destroy", match: :first)
    expect(page).not_to have_content("This post will be deleted")
  end

  scenario "A user can not delete a post if not his" do
    login_percy_onepost
    page.driver.submit :delete, "/posts/9", {}
    expect(page.html).to include("Not your post")
  end

  scenario "A user can not edit a post if not his" do
    login_percy_onepost
    page.driver.submit :patch, "/posts/9", {}
    expect(page.html).to include("Not your post")
  end
end
