class AddDefaultsToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :font_family, :string, :default => 'LightIkaros'
    change_column :users, :background_colour, :string, :default => '#DEB887'
  end
end
