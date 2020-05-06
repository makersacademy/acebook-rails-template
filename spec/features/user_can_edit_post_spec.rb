require 'rails_helper'

RSpec.feature "Edit Post", type: :feature do
  scenario "user can edit existing post" do
    post = Post.create!(message: "Hello World!")
    visit "/posts"
    click_button "Edit post"
    fill_in "message", with: "I'm a new message"
    click_button "Submit"
    expect(page).to have_content("I'm a new message")
    expect(page).not_to have_content("Hello World!")
  end
end



# <h1>Edit Article</h1>
 
# <%= form_with(model: @article, local: true) do |form| %>
 
#   <% if @article.errors.any? %>
#     <div id="error_explanation">
#       <h2>
#         <%= pluralize(@article.errors.count, "error") %> prohibited
#         this article from being saved:
#       </h2>
#       <ul>
#         <% @article.errors.full_messages.each do |msg| %>
#           <li><%= msg %></li>
#         <% end %>
#       </ul>
#     </div>
#   <% end %>
 
#   <p>
#     <%= form.label :title %><br>
#     <%= form.text_field :title %>
#   </p>
 
#   <p>
#     <%= form.label :text %><br>
#     <%= form.text_area :text %>
#   </p>
 
#   <p>
#     <%= form.submit %>
#   </p>
 
# <% end %>
 
# <%= link_to 'Back', articles_path %>