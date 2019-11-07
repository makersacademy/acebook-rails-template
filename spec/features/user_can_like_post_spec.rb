RSpec.feature "Timeline", type: :feature do

  scenario "Can like post" do
    signup_as_new_user("Pam")
    login_as_user("Pam")
    create_new_post("Hello, world!")
    click_button("👅")
    expect(page).to have_content("LICKS: 1")
    expect(page).to have_content("LICKED BY: Pam-Lizard")
  end

  scenario "Can unlike post" do
    signup_as_new_user("Pam")
    login_as_user("Pam")
    create_new_post("Hello, world!")
    click_button("👅")
    expect(page).to have_content("LICKS: 1")
    expect(page).to have_content("LICKED BY: Pam-Lizard")
    click_link('👎🏻')
    expect(page).to have_content("LICKS: 0")
    expect(page).not_to have_content("LICKED BY:")
  end


end
