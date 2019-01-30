require 'rails_helper'

class UserTest < ActiveSupport::TestCase
  RSpec.describe User, type: :model do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:gender) }
    it { should validate_presence_of(:birthday) }
  end
end
