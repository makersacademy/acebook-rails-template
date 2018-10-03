require 'rails_helper'

RSpec.describe 'posts API', type: :request do
  describe 'Get /posts' do
    before { get '/api/v1/posts' }
      it 'returns posts' do
        expect(json).to be_empty
      end
  end
end


# We want something which populates the posts before the tests are run
