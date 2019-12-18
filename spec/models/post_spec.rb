# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be_an_instance_of(described_class) }

  describe '.create' do
    it 'Adds a newly created post to the database' do
      expect { Post.create(message: 'I love cheese.', user_id: User.first.id) }
        .to change { Post.count }.by(1)
    end

    it 'The post message is stored in the database' do
      post = Post.create(message: 'I love cheese.', user_id: User.first.id)
      expect(Post.find(post.id).message).to eq(post.message)
    end
  end
end
