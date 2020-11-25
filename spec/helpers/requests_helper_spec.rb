require 'rails_helper'

def add_posts(test_person)
  post '/posts', params: { 
    post: { 
      message: "Hello Planet 1!", 
      user_id: test_person.id 
      }
    }
  post '/posts', params: { 
    post: { 
      message: "Hello Planet 2!", 
      user_id: test_person.id 
      }
    }
  post '/posts', params: { 
    post: { 
      message: "Hello Planet 3!", 
      user_id: test_person.id 
      }
    }
  post '/posts', params: { 
    post: { 
      message: "Hello Planet 4!", 
      user_id: test_person.id 
      }
    }
end

def add_custom_comment(user:, comment:, post_id:)
  post "/comment_on_posts", params: { 
    comment: { 
      post_id: post_id, 
      comment_text: comment, 
      user_id: user.id 
      } 
    }
  end

