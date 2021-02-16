require 'rails_helper'

RSpec.describe Course, type: :model do
  it "create new course" do
    course = Course.new(user_id: 1, title: "Hello")
    expect(course).to be_valid
  end

  it "is not valid without user" do
    course = Course.new(title: "Hello")
    expect(course).not_to be_valid
  end

  it "is not valid without title" do
    course = Course.new(user_id: 1)
    expect(course).not_to be_valid
  end
end
