feature 'sign up' do
  scenario 'user can sign up with email and password' do
    sign_up
    expect(page).to have_current_path '/'
    expect(page).to have_content 'Signed in as: dan@test.com'
  end

  scenario 'user put less than 6 characters for password' do
    sign_up_with_less_character
    expect(page).to have_content 'password would require 6-10 characters'
  end

  scenario 'user put more than 10 characters for password' do
    sign_up_with_more_character
    expect(page).to have_content 'password would require 6-10 characters '
  end

  scenario 'user password confirmation not the same' do
    sign_up__password_confirmation_no_match
    expect(page).to have_content 'passwords not the same'
  end
end
