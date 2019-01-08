require 'rails_helper'

RSpec.describe Post, type: :model do
  it "responds to create" do
    expect(subject).to respond_to(:create)
  end
end
