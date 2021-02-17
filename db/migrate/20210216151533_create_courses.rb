class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.timestamps
    end
  end
end
