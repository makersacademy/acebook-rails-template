module Helpers
  module Posts
    def make_post
      click_link "New post"
      fill_in "Message", with: "Hello, world!"
      click_button "Submit"
    end
  end
end