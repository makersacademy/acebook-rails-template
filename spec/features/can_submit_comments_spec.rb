RSpec.feature "Timeline", type: :feature do
  scenario "Can submit comments and view them" do
    sign_up
    create_comment
    expect(page).to have_content('Hello, Mars!')
  end
end
