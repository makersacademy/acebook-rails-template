require 'rails_helper'

RSpec.describe Timeline, type: :model do
  it { should belong_to(:user) }
end
