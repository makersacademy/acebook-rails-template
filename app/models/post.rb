class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  delegate :email, :to => :user
  validates :message, presence: true,
            length: { minimum: 10 }
  end
