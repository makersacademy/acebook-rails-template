require 'rails_helper' #is this needed here or could this go into the spec_helper file?

RSpec.feature "delete posts", type: :feature do
  let(:post){ 'Hello, world!'}

  before {
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: post
    click_button "Submit"
  }
  context "user wants to delete a post" do
    it 'has a delete link' do 
        expect(page).to have_link("delete")
    end

    it 'should remove the post from the page on delete' do 
        first('.post').click_link('delete')
        expect(page).to_not have_content(post)
    end
  end
end
