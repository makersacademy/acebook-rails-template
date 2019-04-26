class AddDefaultUserToUsers < ActiveRecord::Migration[5.1]
  def change
    if User.find_by(id: -1)
    else
      User.create({ email: 'notarealemail@makers.com', password: 'admin' })
  end
end
