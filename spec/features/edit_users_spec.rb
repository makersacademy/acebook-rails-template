feature 'editing users' do
  scenario 'there is an edit users button' do
    sign_up
    expect(page).to have_link 'Edit User'
  end
  scenario 'takes us to a new form' do
    sign_up
    click_link 'Edit User'
    expect(page).to have_field('user[name]')
    expect(page).to have_field('user[email]')
    expect(page).to have_field('user[password]')
  end
  scenario 'editing the user edits the user' do
    sign_up
    click_link 'Edit User'
    fill_in 'user[name]', with: 'Edit Johnson'
    fill_in 'user[email]', with: 'Editjohnson@testmail.com'
    fill_in 'user[password]', with: '123456'
    click_button 'Update User'
    expect(page).to have_content 'Hello Edit Johnson'
  end
end
