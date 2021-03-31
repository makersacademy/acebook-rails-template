require_relative 'web_helpers'

feature 'signing up and signing in' do
  scenario 'users can sign up' do
    sign_up_as_testy
    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_link('Sign out')
  end

  scenario 'a signed-in user can sign out' do
    sign_up_as_testy_and_log_out
    visit('/')
    expect(page).to have_link('Sign up')
  end

  scenario 'a signed up user can sign in' do
    sign_up_as_testy_and_log_out
    visit('/users/sign_in')
    fill_in('Email', with: 'test@test.com')
    fill_in('Password', with: 'Password12')
    click_button('Log in')
    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_link('Sign out')
  end

  scenario 'a user tries to log in with an incorrect password' do
    sign_up_as_testy_and_log_out
    fill_in('Email', with: 'test@test.com')
    fill_in('Password', with: 'Password')
    click_button('Log in')
    expect(page).to have_content('Invalid Email or password.')
  end

  scenario 'a user who has not signed up tries to sign in' do
    visit('/users/sign_in')
    fill_in('Email', with: 'hello@hi.com')
    fill_in('Password', with: 'password')
    click_button('Log in')
    expect(page).to have_content('Invalid Email or password.')
  end

  feature "a user can't sign up with an invalid email" do
    scenario ': email is test@me' do
      sign_up_as_testy('test@me')
      expect(page).not_to have_content('Signed in successfully.')
      expect(page).to have_button('Sign up')
    end

    scenario ': email is t..est@me' do
      sign_up_as_testy('t..est@me')
      expect(page).not_to have_content('Signed in successfully.')
      expect(page).to have_button('Sign up')
    end

    scenario ': email is test@me.c' do
      sign_up_as_testy('test@me')
      expect(page).not_to have_content('Signed in successfully.')
      expect(page).to have_button('Sign up')
    end

    scenario ': email is te@st@me' do
      sign_up_as_testy('test@me')
      expect(page).not_to have_content('Signed in successfully.')
      expect(page).to have_button('Sign up')
    end
  end

  scenario 'a new visiter is redirected to sign in page' do
    visit('/posts')
    expect(current_path).to eq('/users/sign_in')
  end

  scenario 'passwords must be longer than 5 characters' do
    visit('/users/sign_up')
    fill_in('Name', with: 'Testy')
    fill_in('Surname', with: 'Testerson')
    fill_in('Email', with: 'test@test.com')
    fill_in('Password', with: 'Pass')
    fill_in('Password confirmation', with: 'Pass')
    click_button('Sign up')
    expect(page).to have_content('Password is too short')
    expect(page).not_to have_content('Signed in successfully.')
  end

  scenario 'passwords must be shorter than 11 characters' do
    visit('/users/sign_up')
    fill_in('Name', with: 'Testy')
    fill_in('Surname', with: 'Testerson')
    fill_in('Email', with: 'test@test.com')
    fill_in('Password', with: 'Password12345')
    fill_in('Password confirmation', with: 'Password12345')
    click_button('Sign up')
    expect(page).to have_content('Password is too long')
    expect(page).not_to have_content('Signed in successfully.')
  end
end
