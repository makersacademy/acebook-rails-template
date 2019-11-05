class UpdatesPostsTable < ActiveRecord::Migration[5.1]
  def change
    change_table :posts do |t|
      t.belongs_to :user
      t.rename :message, :content
    end
  end
end
