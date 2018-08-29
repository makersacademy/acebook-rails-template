require 'rails_helper'

RSpec.describe User, type: :model do

  context "validations" do
    
    it "requires an email" do
      user = User.new(first_name: "Ang", last_name: "Wolff", email: "")
      expect(user.valid?).to eq(false)
    end
  end
end
