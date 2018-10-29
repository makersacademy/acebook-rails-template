# frozen_string_literal: true

class ChangeMessageToStringValue < ActiveRecord::Migration[5.1]
  def change
    change_column :posts, :message, :string
  end
end
