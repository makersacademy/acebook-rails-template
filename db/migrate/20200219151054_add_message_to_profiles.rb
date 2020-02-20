# frozen_string_literal: true

class AddMessageToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :profile_message, :string
  end
end
