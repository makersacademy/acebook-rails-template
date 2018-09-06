require 'rails_helper'
require './app/models/user'

RSpec.describe User, type: :model do
  it { should have_many(:posts) }
end
