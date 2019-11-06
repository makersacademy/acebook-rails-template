require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  describe "validations" do
    let(:post) { FactoryBot.build(:post) }
    it "should have content" do
      post.content = nil
      expect(post).to_not be_valid
    end
  end
end
