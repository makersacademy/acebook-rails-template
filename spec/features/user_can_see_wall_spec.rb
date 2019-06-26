RSpec.feature 'Wall', type: :feature do
  before(:each) do
    sign_up_user
    sign_in_user
  end

  scenario 'User can view their own wall' do
    visit('/posts')
    click_link 'Your Wall'
    expect(page).to have_content("Lisa")
  end

  scenario 'User can see their posts' do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link 'Your Wall'
    expect(page).to have_content("Hello, world!")
  end

  scenario 'Posts on wall should have timestamps' do
    visit "/posts"

    click_link "New post"
    fill_in "Message", with: "First, hello!"
    click_button "Submit"
    time = Post.all[0].created_at.strftime("%Y-%m-%d %H:%M")

    expect(first('.box')).to have_content(time)
  end
end
