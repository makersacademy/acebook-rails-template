RSpec.feature "Available courses", type: :feature do
  scenario "Can view available courses" do
    log_in
    visit "/courses"
    expect(page).to have_content("Intro to Ruby")
  end

  scenario "Can add a course" do
    log_in
    visit "/courses/new"
    fill_in "course_title", with: "TDD - What is it?"
    click_on "Submit"
    expect(page).to have_content("TDD - What is it?")
    visit "/courses"
    expect(page).to have_content("TDD - What is it?")
  end
end

RSpec.feature "Edit courses", type: :feature do
  scenario "Can edit a course" do
    log_in
    visit "/courses/1"
    fill_in "course_title", with: "Intro to Python"
    click_on "Submit"
    expect(page).to have_content "Intro to Python"
  end

  scenario "Cannot edit a course you don't own" do
    sign_up_and_in_new_user
    visit "/courses/1"
    expect(page).not_to have_selector(:link_or_button, 'Edit Course')
  end

end