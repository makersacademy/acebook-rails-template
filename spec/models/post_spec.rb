# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
    before do
        @user = User.new(name: "Lizardo", email: "lizard@example.com", password: "123secure", password_confirmation: "123secure")
        @user.save
        @post = @user.posts.build(message: "Hello world")
    end

    subject { @post }

    it { is_expected.to be_valid }

    describe "when user_id is not present" do
        before { @post.user_id = nil }
        it { is_expected.not_to be_valid }
    end

    describe "content should be present" do
        before { @post.message = "      " }
        it { is_expected.not_to be_valid }
    end
end
