feature 'user can comment on post' do
  scenario 'from the timeline' do
    sign_up
    create_post
    click_link 'Home'
    fill_in 'comment[body]', with: 'Hello'
    click_button 'Add Comment'
    expect(page).to have_content('Hello')
  end

  scenario 'from a user homepage' do
    sign_up
    create_post
    fill_in 'comment[body]', with: 'Jack the Mac'
    click_button 'Add Comment'
    expect(page).to have_content('Jack the Mac')
  end
end