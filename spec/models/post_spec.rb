# frozen_string_literal: true

require "rails_helper"

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  describe "editable?" do
    it "returns true if a post is less than ten minutes old" do
      u = User.create(email: "my@email.address", password: "password")
      p = Post.create(message: "Hello", author_id: u.id)
      p.created_at = 9.minutes.ago
      expect(p.editable?).to be true
    end

    it "returns false if a post is ten minutes old" do
      u = User.create(email: "my@email.address", password: "password")
      p = Post.create(message: "Hello", author_id: u.id)
      p.created_at = 10.minutes.ago
      expect(p.editable?).to be false
    end
  end
end
