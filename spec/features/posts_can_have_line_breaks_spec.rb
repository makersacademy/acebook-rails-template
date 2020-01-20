# require 'rails_helper'

# RSpec.feature "line breaks in posts" do
#   scenario "posts can have line breaks in them" do
#     sign_up('Harry', 'Mumford', 'harry_mumford@hotmail.co.uk', 'password')
#     new_post('This post\r\nhas line breaks')
#     expect(page).html.should include('<p>This post<br>has line breaks</p>')
#     expect(page).to have_selector("br")
#     p page.body.index('This post ')
#     p page.body.index(' has line breaks')
#     expect(page.body.index('This post ')).to be > page.body.index(' has line breaks')
#   end
# end
