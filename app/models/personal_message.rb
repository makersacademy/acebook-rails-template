# frozen_string_literal: true

class PersonalMessage < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  validates :body, presence: true
end
