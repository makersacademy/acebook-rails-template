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
