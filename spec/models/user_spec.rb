require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it " User is added to the database" do
    # User.create(email: "a@a.com")
    expect(User.where(email: "a@a.com").present?).to be false
    User.create(email: "a@a.com", password: "testing")
    expect(User.all[0].email).to eq "a@a.com"
    # expect(User.where(email: "a@a.com").present?).to be true
  end
end
