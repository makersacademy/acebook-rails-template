require 'rails_helper'

RSpec.describe User, type: :model do

    it "user has posts" do
      assc = described_class.reflect_on_association(:posts)
      expect(assc.macro).to eq :has_many
    end
end