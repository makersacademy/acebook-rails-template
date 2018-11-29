class Album < ApplicationRecord
  validates :title, presence: true,
                    length: { minimum: 1 }
  belongs_to :user
end
