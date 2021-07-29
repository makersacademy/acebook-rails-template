require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  it 'creates a valid post' do
    post = described_class.new(message: 'hello')
    expect(post).to be_valid
  end

  it 'doesnt allow a blank post' do
    post = described_class.new(message: '')
    expect(post).not_to be_valid
  end
end
