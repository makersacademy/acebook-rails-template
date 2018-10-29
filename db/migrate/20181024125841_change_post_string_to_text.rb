# frozen_string_literal: true

class ChangePostStringToText < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :message, :information
  end
end
