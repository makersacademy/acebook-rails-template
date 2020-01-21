RSpec.feature "Timeline", type: :feature do

    let(:user) { create(:user) }

    before do
        sign_up("test@example.com", "pass123", "pass123")
        click_link "Sign out"
    end

    scenario "Can see the Add friends button on own wall and click on it" do
        sign_in("#{user.email}", "hey12345")
        expect(page).to have_link("Add friends")
        click_link "Add friends"

        expect(page).to have_current_path "/users"
        expect(page).to have_content("test@example.com")
        expect(page).to have_link("Add friend")
        expect(page).not_to have_content("test@example.com")
        expect(page).not_to have_link("Add friend")

    end



end