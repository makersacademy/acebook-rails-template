# frozen_string_literal: true

class RemoveFilednameFromProfile < ActiveRecord::Migration[5.1]
  def change
    remove_column :profiles, :filedname, :string
  end
end
