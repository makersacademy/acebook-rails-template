require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it " User is added to the database" do
    User.create(email: "a@a.com")
    expect(User.all[0].email).to eq "a@a.com"
  end

end
