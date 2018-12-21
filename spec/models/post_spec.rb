require 'rails_helper'

RSpec.describe Post, type: :model do
  
  describe "Dependency" do
    it { should have_many(:comments).dependent(:destroy) }
  end

  describe "Validations" do
    it { should validate_presence_of(:description) }

    it do
      should validate_length_of(:description).
      is_at_least(1).
      on(:create)
    end
  end

end
