require 'rails_helper'
require 'timecop'

RSpec.describe Post, type: :model do

  Time.freeze

  subject(:post) { described_class.create(:created_at => Time.now)}

  describe '#edit_timer?' do
    it 'returns true if less than 10 minutes have passed' do
      expect(post.edit_timer?).to eq(true)
    end
  end
end
