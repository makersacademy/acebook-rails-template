# frozen_string_literal: true

class Post < ApplicationRecord

	validates_presence_of :user_id, :message
	belongs_to :user
	has_many :comments, dependent: :destroy

end
