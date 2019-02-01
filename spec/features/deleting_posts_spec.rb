require 'rails_helper' #is this needed here or could this go into the spec_helper file?

RSpec.feature "delete posts", type: :feature do

  before {
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
  }
  context "user wants to delete a post" do
    it 'has a delete link' do 
        expect(page).to have_link("delete")
    end
  end
end
