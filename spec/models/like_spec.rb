require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'belongs to a user' do
    association = described_class.reflect_on_association(:user).macro
    expect(association).to eq :belongs_to
  end

  it 'belongs to likeable' do
    association = described_class.reflect_on_association(:likeable).macro
    expect(association).to eq :belongs_to
  end
end
