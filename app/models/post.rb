# frozen_string_literal: true

class Post < ApplicationRecord
  acts_as_votable
  has_many :comments, dependent: :destroy
  validates :message, presence: true, length: { minimum: 1 }
  belongs_to :user
end
