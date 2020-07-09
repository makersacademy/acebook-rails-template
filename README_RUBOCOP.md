61 files checks , 99 issues - REMEMBER TO REVIEW COMMENTS LINES


2 problems in gem file, just a comments too long

Inside controller folder each file needs
Missing top-level class documentation comment.

 # frozen_string_literal: true on top  necessary on top of controllers files


 # rubocop:disable all on top of each files inside controller folder OR create a .rubocop.yml file in the main root and fill with this text: Documentation:
  								Enabled: false



Fixed indentation problems
61 files inspected, 76 offenses detected - We are going to run spec before and after
Before uncomment line 11 in application_controller.rb, same in each scenario.

We decide to comment line 11 in application controller.


Following this walkthough (https://hixonrails.com/ruby-on-rails-tutorials/ruby-on-rails-project-rubocop-setup-with-rspec/) we

Added gems and updated the rubocop.yml file, with some style preferences.

We added these changes and commited 'Added Rubocop gems and set-up Rubo...'

We ran 'bundle exec rubocop --safe-auto-correct' and looked though the changes.

Many of these changes were; blank space, indentation, switching syntax 'scenario'
for 'it'


spec/controllers/posts_controller_spec.rb
expect(response).to have_http_status(200)

was switched to...
expect(response).to have_http_status(:ok)


spec/features/user_can_submit_posts_spec.rb
expect(page).to have_content("#{Time.now.strftime('%B %d %Y')}")

was switched to...
expect(page).to have_content(Time.now.strftime('%B %d %Y').to_s)









CODE TO REVIEW
/app/controllers/application_controller.rb line 11 - 15
def require_login
  # current_user = false
  # if session[:user_id].nil?
  #   p 'LOGGED IN'
  #   redirect_to '/login'
  # end
  return unless session[:user_id].nil?

  p 'LOGGED IN'
  redirect_to '/login'
end
end
app/controllers/sessions_controller.rb line 9
