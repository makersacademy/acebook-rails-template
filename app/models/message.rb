# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user

  after_create_commit do
    MessageBroadcastJob.perform_later(self)
  end
end
