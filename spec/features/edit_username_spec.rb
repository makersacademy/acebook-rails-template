# frozen_string_literal: true

feature 'user can update account' do
  scenario 'user can update username' do
    sign_up
    find('#dropdown03')
    click_link 'Update Account'
    fill_in 'user[username]', with: 'David'
    click_button 'Update account'
    expect(page).not_to have_content('uvalente')
    expect(page).to have_content('David')
  end

  scenario 'user can not update username if already exists' do
    User.create!(username: 'David', email: 'david@acebook.com', password: 'password')
    sign_up
    find('#dropdown03')
    click_link 'Update Account'
    fill_in 'user[username]', with: 'David'
    click_button 'Update account'
    expect(page).to have_content('Apologies, this username is already taken')
  end
end
