# frozen_string_literal: true

class AddSenderIdToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :sender_id, :integer
  end
end
