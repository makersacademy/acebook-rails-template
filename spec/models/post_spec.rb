require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }
end

describe "here is a failing test" do
  it "should fail" do
    expect("hello").to eq "goodbye"
  end
end