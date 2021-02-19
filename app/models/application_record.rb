class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
class Profile < ApplicationRecord
  has_one_attached :avatar
  accepts_nested_attributes_for :avatar_attachment, allow_destroy: true
end
