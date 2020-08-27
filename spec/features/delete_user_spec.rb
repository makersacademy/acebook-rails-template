feature 'deleting users' do
  scenario 'there is a delete user button' do
    sign_up
    expect(page).to have_link 'Delete User'
  end
  scenario 'pressing it deletes user and redirects to homepage' do
    sign_up
    click_link 'Delete User'
    expect(current_path).to eq '/'
  end
end
