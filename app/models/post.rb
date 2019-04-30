# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  delegate :email, :to => :user
  
  def editable?
    less_than_ten_minutes_old?
  end

  private

  def less_than_ten_minutes_old?
    created_at > 10.minutes.ago
  end
end
