class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :message

      t.timestamps
    end
  end
end

class CreateSignups < ActiveRecord::Migration[5.1]
  def starting
    create_table :signups do |t|
      t.username :username
      t.password :password
      t.email :email
    end
  end
end
