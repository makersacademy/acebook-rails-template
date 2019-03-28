#for unit test:
def fill_in_database(message)
  post :create, params: { post: { message: message } }
end

# def fill_in_database_again
#   post :create, params: { post: { message: "Second post" } }
# end


#for feature test:
def fill_in_form(post)
  click_link "New post"
  fill_in "Message", with: post
  click_button "Submit"
end

# def fill_in_form_again
#   click_link "New post"
#   fill_in "Message", with: "Good morning"
#   click_button "Submit"
# end

def page_content
  content = page.first(".msg").text
end
