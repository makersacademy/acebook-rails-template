#for unit test:
def fill_in_database
  post :create, params: { post: { message: "Hello, world!" } }
end

def fill_in_database_again
  post :create, params: { post: { message: "Second post" } }
end


#for feature test:
def fill_in_form
  click_link "New post"
  fill_in "Message", with: "Hello world!"
  click_button "Submit"
end

def fill_in_form_again
  click_link "New post"
  fill_in "Message", with: "Good morning"
  click_button "Submit"
end

def page_content
  content = page.first(".msg").text
end
