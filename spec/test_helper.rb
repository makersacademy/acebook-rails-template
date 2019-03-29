def fill_in_database(message)
  post :create, params: { post: { message: message } }
end

def fill_in_form(post)
  click_link "New post"
  fill_in "Message", with: post
  click_button "Submit"
end

def page_content
  page.first(".msg").text
end
