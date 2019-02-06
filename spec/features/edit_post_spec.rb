require 'spec_helper'

RSpec.feature "edit post", type: :feature  do 
  let(:message){ 'Hello, world!'}
  let(:email){'bea_courage@hotmail.co.uk'}
  let(:password){'testingisfunlol'}

  before(:each) {
    sign_up(email, password)
    post_message(message)
  }

  context "user wants to edit a post" do
    it 'has a edit link' do
        expect(page).to have_link("edit")
    end

    # it 'user can can see the post that can be edited in the form' do
    #     first('.post').click_link('edit')
    #     expect(page).to_not have_content(message)
    # end
  end

end 