# frozen_string_literal: true

class Sessions < ApplicationRecord
  attr_reader :current_user
  def self.log_in(user)
    @current_user = user
  end
end
