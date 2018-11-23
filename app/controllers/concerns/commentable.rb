# frozen_string_literal: true

# Include me in models you want to comment on
module Commentable
  extend ActiveSupport::Concern

  included do
    has_many :comments, as: :commentable
  end
end
