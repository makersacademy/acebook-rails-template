# frozen_string_literal: true

class AddMessagesToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :filedname, :string
  end
end
