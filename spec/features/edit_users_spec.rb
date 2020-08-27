feature 'editing users' do
  scenario 'there is an edit users button' do
    sign_up
    expect(page).to have_link 'Edit User'
  end
  scenario 'takes us to a new form' do
    sign_up
    click_link 'Edit User'
    expect(page).to have_field("user[name]")
    expect(page).to have_field("user[email]")
    expect(page).to have_field("user[password]")
  end
end
