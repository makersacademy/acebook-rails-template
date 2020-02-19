class AddMessagesToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :filedname, :string
  end
end
