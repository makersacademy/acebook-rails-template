
require 'rails_helper'

feature 'site roots to pages index for signed in users' do
    before do
      @user = User.new(name: "Lizardo", email: "lizard@example.com", password: "123secure", password_confirmation: "123secure")
      @user.save
      sign_in_helper(@user)
    end

    scenario 'user visits root path' do
        visit('/')
        expect(current_path).to eq('/posts')
    end
end