RSpec.feature 'Wall', type: :feature do
  scenario 'User can view their own wall' do
    sign_up_user
    sign_in_user
    visit('/posts')
    click_link 'Your Wall'
    expect(page).to have_content("Yoyoyo")
  end
end
