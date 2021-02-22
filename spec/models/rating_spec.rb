require 'rails_helper'

RSpec.describe Rating, type: :model do
  it "create new post" do
    rating = Rating.new(course_id: 2, user_id: 1, value: 1)
    expect(rating).to be_valid
  end

  it "is not valid without a course" do
    rating = Rating.new(user_id: 1, value: 1)
    expect(rating).not_to be_valid
  end

  it "is not valid without a user" do
    rating = Rating.new(course_id: 2, value: 1)
    expect(rating).not_to be_valid
  end

  it "is not valid without a value" do
    rating = Rating.new(course_id: 2, user_id: 1)
    expect(rating).not_to be_valid
  end

  it "is not valid if the value isn't between 1-5 (inclusive)" do
    rating = Rating.new(course_id: 2, user_id: 1, value: 10)
    expect(rating).not_to be_valid
  end

  it "is not valid if the user repeats a rating" do
    rating = Rating.new(course_id: 1, user_id: 1, value: 5)
    expect(rating).not_to be_valid
  end

end
