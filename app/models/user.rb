# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments
  has_many :likes

  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'received_id'
  has_many :personal_messages, dependent: :destroy

  def online?
    !Redis.new.get("user_#{id}_online").nil?
  end
  
  has_attached_file :avatar, styles: { medium: '250x250#', thumb: '100x100#' },
                             default_url: 'avatar_:style.png'

  validates_attachment_content_type :avatar, content_type: %r{\Aimage/.*\z}
end
