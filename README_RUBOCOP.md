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


BEFORE:
spec/controllers/posts_controller_spec.rb:46:55: C: RSpec/Be: Don't use be without a
n argument.
      expect(Post.find_by(message: "Hello, world")).to be
AFTER:
expect(Post.find_by(message: 'Hello, world!')).to be   true



WE DON'T NEED TWO EXPECT AT THE END IF WE FOLLOW THE RUBOCOP RULES
/Users/emanuele/Projects/acebook-rails-template/spec/controllers/posts_controller_spec.rb

describe 'Update' do
  xit 'Updates a post' do
    post :create, params: { post: { message: 'Hello, world!' } }
    found_post = Post.find_by(message: 'Hello, world!')
    patch :update, params: { id: found_post.id, post: { message: "I'm updated" } }
    expect(Post.find_by(message: "I'm updated")).to be
    expect(Post.find_by(message: 'Hello, world!')).not_to be
  end
end










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
