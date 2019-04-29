# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  delegate :email, :to => :user
  
  def isEditable
    isLessThan10MinutesOld
  end

  private

  def isLessThan10MinutesOld
    created_at > 10.minutes.ago
  end
end
