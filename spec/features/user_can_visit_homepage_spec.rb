RSpec.feature 'Visit hompage', type: :feature do
  scenario 'User visit homepage and is welcomed' do
    visit '/'
    expect(page).to have_content('Welcome to Catbook!')
  end
end
