RSpec.feature "updating posts", type: :feature do

    let(:post){ 'Hello, world!'}
    
    before {
        visit "/posts"
        click_link "New post"
        fill_in "Message", with: post
        click_button "Submit"
      }

    context 'user wants to update a post' do 
    end 

end