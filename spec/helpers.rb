module Helpers
  def log_in_gina
    visit "/sessions/new"
    fill_in "session[name]", with: "Gina"
    fill_in "session[password]", with: "123456"
    click_on "Log in"
  end

  
  def send_post_hello
    click_on "New post"
    fill_in "Message", with: "Hello"
    click_on "Submit"
  end  
  
  


end
