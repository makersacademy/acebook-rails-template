require 'rails_helper'

RSpec.describe Post, type: :model do
  it { expect(described_class).to be < ApplicationRecord }
end
