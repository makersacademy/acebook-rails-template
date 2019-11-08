RSpec.feature "Timeline", type: :feature do

  scenario "Can like post" do
    signup_as_new_user("Pam")
    login_as_user("Pam")
    create_new_post("Hello, world!")
    click_button("👅")
    expect(page).to have_content("1 licks")
    expect(page).to have_content("LICKED BY: Pam-Lizard")
  end

  scenario "Can unlike post" do
    signup_as_new_user("Pam")
    login_as_user("Pam")
    create_new_post("Hello, world!")
    click_button("👅")
    expect(page).to have_content("1 licks")
    expect(page).to have_content("LICKED BY: Pam-Lizard")
    click_link('👎')
    expect(page).to have_content("0 licks")
    expect(page).not_to have_content("LICKED BY:")
  end


end
