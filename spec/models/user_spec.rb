require 'rails_helper'

RSpec.describe User, type: :model do
  it " User is added to the database" do
    User.create(email: "a@a.com", password: "testing")
    expect(User.all[0].email).to eq "a@a.com"
  end
end
