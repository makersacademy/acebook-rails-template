require './spec/web_helper.rb'

feature 'user log in' do
  scenario 'user log in with right credentials' do
    sign_up
    visit('/')
    click_link('Sign In')
    fill_in 'session[email]', with: 'umberto@acebook.com'
    fill_in 'session[password]', with: 'password'
    click_button 'Save Session'
    expect(page).to have_content('Welcome umberto@acebook.com')
  end
end
