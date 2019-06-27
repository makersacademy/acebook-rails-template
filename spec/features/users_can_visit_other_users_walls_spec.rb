feature "Clicking onto other user's walls" do
  before(:each) do
    sign_up_user
    sign_in_user
  end

  scenario "From the index, each post should have a link to that user's wall" do
    fill_in 'post_message', with: 'Hello world'
    click_button 'Submit'
    sign_up_another_user
    sign_in_another_user
    click_button 'Feed'
    id = User.all[0].id
    click_link 'Lisa'
    expect(current_path).to eq("/users/#{id}")
  end

  scenario "From a wall, each post should have a link to that user's wall" do
    fill_in 'post_message', with: 'Hello world'
    click_button 'Submit'

    sign_up_another_user
    sign_in_another_user
    id = User.all[0].id
    click_button 'Feed'
    click_link 'Lisa'
    expect(current_path).to eq("/users/#{id}")
  end
end
