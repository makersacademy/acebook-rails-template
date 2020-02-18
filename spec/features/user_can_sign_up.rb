require 'rails_helper'


feature "test sign up" do
 scenario "Can Sign up and see posts page with Hello on it" do
    sign_up
    expect(page).to have_content("Hello")

  end
end



