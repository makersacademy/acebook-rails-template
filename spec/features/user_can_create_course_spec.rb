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