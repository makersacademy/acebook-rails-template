require 'rails_helper' #is this needed here or could this go into the spec_helper file?

RSpec.feature "delete posts", type: :feature do
  let(:message){ 'Hello, world!'}
  let(:email){'bea_courage@hotmail.co.uk'}
  let(:password){'testingisfunlol'}

  before {
    sign_up(email, password)
    post_message(message)
  }
  context "user wants to delete a post" do
    it 'has a delete link' do
        expect(page).to have_link("delete")
    end

    it 'should remove the post from the page on delete' do
        first('.post').click_link('delete')
        expect(page).to_not have_content(message)
    end
  end
end
