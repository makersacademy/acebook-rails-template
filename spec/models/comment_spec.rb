require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to validate_presence_of(:message) }
  it { should belong_to(:post) }
  it { should belong_to(:user) }
end
