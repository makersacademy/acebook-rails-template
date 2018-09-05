require 'rails_helper'
require 'spec_helper'

def create_post
  click_link('New post')
  fill_in 'post[message]', with: 'Hello, world!'
  click_button 'Create Post'
end

# RSpec.describe PostsHelper, type: :helper do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
