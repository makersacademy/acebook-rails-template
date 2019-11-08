# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  def not_editable?
    return unless (Time.now - created_at) > 600
  end

  def can_destroy?
    destroy
  end

end
