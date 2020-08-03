module Helpers
  module Submission
    def creating_post(message)
      visit '/posts'
      click_link 'New post'
      fill_in 'Message', with: message
      click_button 'Submit'
    end
  end
end