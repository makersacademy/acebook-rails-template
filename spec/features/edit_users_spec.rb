feature 'editing users' do
  scenario 'there is an edit users button' do
    visit 'users/new'
    fill_in "user[name]", with: "Test Johnson"
    fill_in "user[email]", with: "testjohnson@testmail.com"
    fill_in "user[password]", with: "1234"
    click_button 'Save User'
    expect(page).to have_link 'Edit User'
  end
end
