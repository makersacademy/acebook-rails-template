# frozen_string_literal: true

class Post < ApplicationRecord

    belongs_to :user

    validates :message, presence: true
    # validates
    has_attached_file :photo, styles { medium: '300x300>', thumb: '100x100>'}
    validates_attachement_content_type :photo, content_type: /\Aimage\/.*\z/
end
