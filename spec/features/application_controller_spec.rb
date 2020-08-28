feature 'application controller' do
  scenario 'it tells you to log in' do
    visit '/users/1'
    expect(page).to have_content 'Please log in.'
  end
end