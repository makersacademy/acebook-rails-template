# frozen_string_literal: true

class Post < ApplicationRecord
    belongs_to :user
    validate :is_editable, unless: :new_record?

    def is_editable
        if Time.now.to_i < created_at.since(600).to_i 
        else 
            format.html { redirect_to posts_url, notice: 'Cannot edit' }
        end 
    end 
end