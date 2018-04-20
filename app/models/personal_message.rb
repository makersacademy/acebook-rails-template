# frozen_string_literal: true

class PersonalMessage < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  validates :body, presence: true

  after_create_commit do
    NotificationsBroadcastJob.perform_later(self)
  end
end
