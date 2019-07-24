def post_hi_earth
  click_link "New post"
  fill_in "Message", with: "Hi, earth!"
  click_button "Submit"
end
