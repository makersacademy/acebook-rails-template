RSpec.feature "Timeline", type: :feature do
  scenario 'can edit posts' do
    sign_up
    new_post
    click_on 'Edit'
    fill_in "post[message]", with: 'Updated message'
    click_on 'Update Post'
    expect(page).to have_content('Updated message')
  end
  
  scenario 'unable to edit post more than 10 minutes after creation' do
    sign_up
    new_post
    Timecop.freeze(Time.now + 660)
    click_on 'Edit'
    fill_in "post[message]", with: 'Updated message'
    click_on 'Update Post'
    expect(page).to have_content("Unable to edit post over 10 mins after creation")
  end

end
