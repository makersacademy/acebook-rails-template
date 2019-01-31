class CreatePosts < ActiveRecord::Base
  belongs_to :user
  def change
    create_table :posts do |t|
      t.string :message
      t.references :user

      t.timestamps
    end
  end
end
