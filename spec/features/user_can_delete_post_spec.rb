RSpec.feature 'Delete post', type: :feature do
  scenario 'User can delete a post' do
    sign_up
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'Hello, world!'
    click_link 'Delete'
    expect(page).not_to have_content('Hello, world!')
  end

  # scenario 'User cannot delete other user posts' do
  #   post = Post.create("message" => "Delete me")
  #   sign_up
  #   expect(page).not_to have_link("You can't delete me")
  # end
end
