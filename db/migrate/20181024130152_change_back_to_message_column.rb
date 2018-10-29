# frozen_string_literal: true

class ChangeBackToMessageColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :information, :message
  end
end
