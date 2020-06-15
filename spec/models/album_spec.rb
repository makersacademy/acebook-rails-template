require 'rails_helper'

RSpec.describe Album, type: :model do
  it "should allow user to create multiple albums" do
    user = User.create({ email: 'beefy@beefmaster.com', password: 'suckurnan' })
    album = Album.create({ name: 'beefy', user_id: 1 })
    album2 = Album.create({ name: 'beefy', user_id: 1 })
    expect(Album.where(user_id: 1).count).to eq(2)
  end

  it "album has to have a user" do
    expect{Album.create({ name: 'beefy'})}.to raise_error ActiveRecord::NotNullViolation
  end

end
