require 'rails_helper'
require 'spec_helper'

RSpec.describe PostsController, type: :controller do

  # let(:post) { create(:post) }

  it 'should show post' do
    post = Post.new
    post = Post.create!(description: "content")
    get :show, params: { id: post.id }
    expect(response.status).to eq(200)
  end



end
