# frozen_string_literal: true

class User < ApplicationRecord
has_many :posts
  include Clearance::User

  validates :username, presence: true, uniqueness: true
end
