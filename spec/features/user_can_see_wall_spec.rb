RSpec.feature 'Wall', type: :feature do
  scenario 'User can view their own wall' do
    sign_up_user
    sign_in_user
    visit('/posts')
    click_link 'Your Wall'
    expect(page).to have_content("Lisa")
  end

  scenario 'User can see their posts' do
    sign_up_user
    sign_in_user
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link 'Your Wall'
    expect(page).to have_content("Hello, world!")
  end
end
