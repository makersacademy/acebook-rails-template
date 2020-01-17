RSpec.feature "Timeline", type: :feature do
  scenario "Can view date and time of post" do
    sign_up
    new_post
    now = DateTime.now
    expect(page).to have_current_path '/posts'
    expect(page).to have_content(now.strftime("%C%y-%m-%d %H:%M:%S"))
  end
end
