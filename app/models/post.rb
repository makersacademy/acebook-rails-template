# frozen_string_literal: true

class Post < ApplicationRecord

    belongs_to :user
    has_many :likes, dependent: :destroy
    validates :message, presence: true
    has_attached_file :photo, styles: { medium: '300x300>', thumb: '100x100>'}
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
