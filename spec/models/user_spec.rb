require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to be }
  describe User.new(name: "Jim") do
    it { is_expected.to have_attributes(:name => "Jim") }
  end
end
