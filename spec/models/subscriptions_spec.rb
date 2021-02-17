require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it "create new subscription" do
    sub = Subscription.new(course_id: 1, user_id: 1)
    expect(sub).to be_valid
  end

  it "is not valid without a course" do
    sub = Subscription.new(user_id: 1)
    expect(sub).not_to be_valid
  end

  it "is not valid without content" do
    sub = Subscription.new(course_id: 1)
    expect(sub).not_to be_valid
  end

  it "is not valid if repeating a subscription" do
    Subscription.create(course_id: 1, user_id: 1)
    sub = Subscription.new(course_id: 1, user_id: 1)
    expect(sub).not_to be_valid
  end
end
