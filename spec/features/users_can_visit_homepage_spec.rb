RSpec.feature 'Users can visit Homepage', type: :feature do
  scenario 'Can visit homepage' do
    visit '/'
    expect(page).to have_content('Welcome to Acebook')
  end
end
