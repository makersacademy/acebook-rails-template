# frozen_string_literal: true

class PopulateNullUserIdsInPosts < ActiveRecord::Migration[5.1]
  def change
    Post.where('user_id IS NULL').update_all(user_id: -1)
  end
end
