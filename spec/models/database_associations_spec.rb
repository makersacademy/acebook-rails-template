require 'rails_helper'
describe 'Database associations' do
  describe 'Post' do
    it 'belongs to users' do
        association = Post.reflect_on_association(:user)
        expect(association.macro).to eq :belongs_to
      end
    it 'has many comments' do
        association = Post.reflect_on_association(:comments)
        expect(association.macro).to eq :has_many
      end
    end
  describe 'User' do
    it 'has many posts' do
      association = User.reflect_on_association(:posts)
      expect(association.macro).to eq :has_many
    end
    it 'has many comments' do
      association = User.reflect_on_association(:comments)
      expect(association.macro).to eq :has_many
    end
  end
  describe 'Comment' do
    it 'is commentable' do
      association = Comment.reflect_on_association(:commentable)
      expect(association.macro).to eq :belongs_to
    end
    it 'has many comments' do
        association = Comment.reflect_on_association(:comments)
        expect(association.macro).to eq :has_many
      end

  end
end
