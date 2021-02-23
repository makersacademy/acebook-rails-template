class CreateRatings < ActiveRecord::Migration[6.1]	
  def change	
    create_table :ratings do |t|	
      t.references :user, foreign_key: true	
      t.references :course, foreign_key: true	
      t.integer :value	
      t.timestamps	
    end	

    remove_column :courses, :rating	
  end	
end