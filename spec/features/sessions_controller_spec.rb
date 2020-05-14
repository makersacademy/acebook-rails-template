require 'rails_helper'
RSpec.feature "Sessions Controller", type: :feature do
  scenario "post to create session with correct credentials returns json with status 'created' and the user" do
    User.create(
      first_name: "Sam",
      last_name: "Gangi",
      email: "samgangi@lotr.com",
      password: "theshire"
    )

    page.driver.post('/api/v1/sessions?email=samgangi@lotr.com&password=theshire') 
    expect(page).to have_content('created')
    expect(page).to have_content('Sam')
    expect(page).to have_content('Gangi')
    expect(page).to have_content('samgangi@lotr.com')
  end
  
  scenario "post to create session with incorrect email returns json with status '401'" do
    User.create(
      first_name: "Sam",
      last_name: "Gangi",
      email: "samgangi@lotr.com",
      password: "theshire"
    )

    page.driver.post('/api/v1/sessions?email=INCORRECT@EXAMPLE.com&password=theshire') 
    expect(page).to have_content('401')
  end

    scenario "post to create session with incorrect password returns json with status '401'" do
    User.create(
      first_name: "Sam",
      last_name: "Gangi",
      email: "samgangi@lotr.com",
      password: "theshire"
    )

    page.driver.post('/api/v1/sessions?email=samgangi@lotr.com&password=INCORRECT') 
    expect(page).to have_content('401')
  end
end
