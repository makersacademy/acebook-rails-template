# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  acts_as_commontable

  def not_editable?
    (Time.now - created_at) > 600
  end

  def can_destroy?
    destroy
  end
end
