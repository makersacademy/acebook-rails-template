# frozen_string_literal: true

class Conversation < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  has_many :personal_messages, -> { order(created_at: :asc) }, dependent: :destroy

  scope :participating, ->(user) do
    where('(conversations.author_id = ? OR conversations.reciever_id = )', user.id, user.id)
  end

  def with(current_user)
    author == current_user ? receiver : author
  end

  def participates?(user)
    author == user || reciever == user
  end
end
