RSpec.feature "Edit/update posts", type: :feature do

  scenario "update link vanishes after 10 mins" do
    sign_up
    visit "/posts"
    click_link "New Post"
    post_creation_time = Time.now - 650
    Timecop.freeze(post_creation_time)
      fill_in "Message", with: "Hello, world!"
      click_button "Submit"
    Timecop.return # "turn off" Timecop
    page.refresh
    expect(page).to_not have_link("Update")
  end

  scenario "redirected to posts page if you try to access edit url after 10 mins" do
    sign_up
    visit "/posts"
    click_link "New Post"
    post_creation_time = Time.now - 650
    Timecop.freeze(post_creation_time)
      fill_in "Message", with: "Hello, world!"
      click_button "Submit"
    Timecop.return # "turn off" Timecop
    url_id = Post.find_by(message: "Hello, world!").id
    visit "/posts/#{url_id}/edit"
    expect(current_url).to eq("http://www.example.com/posts")
  end


end
