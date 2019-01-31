require 'rails_helper'
require 'timecop'

RSpec.describe Post, type: :model do

  subject(:post) { described_class.create(:created_at => Time.now)}
  subject(:early_post) { described_class.create(:created_at => (Time.now - 601))}

  describe '#edit_timer?' do
    it 'returns true if less than 10 minutes have passed' do
      expect(post.edit_timer?).to eq(true)
    end

    it 'returns false if more than 10 minutes have passed' do
      expect(early_post.edit_timer?).to eq(false)
    end
  end
end
