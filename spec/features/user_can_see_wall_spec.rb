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
    fill_in "post_message", with: "Hello, world!"
    click_button "Submit"
    click_link 'Your Wall'
    expect(page).to have_content("Hello, world!")
  end

  scenario "Posts are ordered - newest at the top" do
    visit "/posts"
    fill_in "post_message", with: "First, hello!"
    click_button "Submit"

    fill_in "post_message", with: "Second, hello!"
    click_button "Submit"

    click_link 'Your Wall'
    expect(first('.box')).to have_content("Second, hello!")
  end

  scenario 'Posts on wall should have timestamps' do
    visit "/posts"

    fill_in "post_message", with: "First, hello!"
    click_button "Submit"
    time = Post.all[0].created_at.strftime("%Y-%m-%d %H:%M")
    click_link 'Your Wall'
    expect(first('.box')).to have_content(time)
  end

  scenario 'Users can delete posts' do
    visit '/posts'
    fill_in 'post_message', with: 'First line hello!'
    click_button 'Submit'

    click_link 'Your Wall'
    expect(first('.box')).to have_content('First line hello!')
    click_link('Delete')
    expect(page).not_to have_content('First line hello!')
  end

  scenario 'Users can edit posts' do
    visit '/posts'
    fill_in 'post_message', with: 'First line hello!'
    click_button 'Submit'

    click_link 'Your Wall'
    expect(first('.box')).to have_content('First line hello!')
    click_link('Edit')
    post_id = Post.all[0].id
    expect(current_path).to eq("/posts/#{post_id}/edit")
  end

  scenario 'Post displays the name of the user who made it' do
    fill_in 'post_message', with: 'First line hello!'
    click_button 'Submit'

    expect(first('.box')).to have_content('Lisa')
  end

  scenario "Posts display the name of the user's wall that the post belongs to" do
    fill_in 'post_message', with: 'First line hello!'
    click_button 'Submit'
    click_button 'Sign Out'
    sign_up_another_user
    sign_in_another_user
    click_button 'Feed'
    click_link 'Lisa'
    fill_in 'post_message', with: 'Hi hi hiiiiiii!'
    click_button 'Submit'
    expect(first('.box')).to have_content('Test')
  end

end
