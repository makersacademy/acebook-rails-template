
RSpec.feature 'Post', type: :feature do
  scenario 'Newest posts appear first' do
    fill_in_sign_up_details
    click_button 'Sign Up'
    click_link "New post"
    fill_in "Message", with: 'First message'
    click_button 'Submit'
    click_link "New post"
    fill_in "Message", with: 'Second message'
    click_button 'Submit'
    expect('Second message').to appear_before('First message')
  end
end
