class AddMessageToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :message, :string
  end
end
