# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'requires an email' do
      #binding.pry
      user = User.new(first_name: 'Ang', last_name: 'Wolff', email: '')
      expect(user.valid?).to eq(false)
    end

    it 'requires a valid email address' do
      user = User.new(first_name: 'R', last_name: 'F', email: 'chimichangas.com')
      expect(user.valid?).to eq(false)
    end

    it 'requires a first name' do
      user = User.new(first_name: '', last_name: 'Kerr', email: 'chimichangas@gmail.com')
      expect(user.valid?).to eq(false)
    end

    it 'requires a last name' do
      user = User.new(first_name: 'AngeCus', last_name: '', email: 'chimichangas@gmail.com')
      expect(user.valid?).to eq(false)
    end
  end

  context 'uniqueness' do
    it 'does not allow users to be created with the same email address' do
      user = User.new(first_name: 'Chimi', last_name: 'Changa', email: 'chimichanga@gmail.com')
      duplicate_user = user.dup
      duplicate_user.email = user.email.upcase
      user.save
      expect(duplicate_user.valid?).to eq(false)
    end
  end

  context 'password' do
    it 'should be present (non blank)' do
      user = User.new(first_name: 'Chimi', last_name: 'Changa', email: '')
      user.password = user.password_confirmation = " " * 6
      expect(user.valid?).to eq(false)
    end

    it 'should have a minimum length' do
      user = User.new(first_name: 'Chimi', last_name: 'Changa', email: '')
      user.password = user.password_confirmation = "a" * 5
      expect(user.valid?).to eq(false)
    end
  end
end
