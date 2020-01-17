RSpec.feature "Timeline", type: :feature do
  scenario 'can edit posts' do
    sign_up
    new_post
    click_on 'Edit'
    fill_in "post[message]", with: 'Updated message'
    click_on 'Update Post'
    expect(page).to have_content('Updated message')
  end

end
