module Helpers
  module Submission
    def creating_post(message)
      #visit '/posts'
      click_link_or_button 'New post'
      fill_in 'post_message', with: message
      click_link_or_button 'Submit'
    end
  end
end