require 'rails_helper'

RSpec.describe User, type: :model do

  it { expect(described_class).to be < ApplicationRecord }

  describe '#authenticate' do

    it 'returns true if given correct password' do
      user = User.create(first_name: "test_first_name", last_name: "test_last_name", email: "test_email@keepingitrails.com", password: "pa55w0rd")
      expect(user.authenticate("pa55w0rd")).to be_truthy
    end

    it 'returns false if given incorrect password' do
      user = User.create(first_name: "test_first_name", last_name: "test_last_name", email: "test_email@keepingitrails.com", password: "pa55w0rd")
      expect(user.authenticate("wrong_pa55w0rd")).to be_falsey
    end

  end

  describe '#create' do

    it 'returns false if given email address not in database' do
      User.create(first_name: "test_first_name", last_name: "test_last_name", email: "test_email@keepingitrails.com", password: "pa55w0rd")
      expect(User.exists?(email: "jeff@keepingitrails.com")).to be_falsey
    end

    it 'returns true if given email address is in database' do
      User.create(first_name: "test_first_name", last_name: "test_last_name", email: "test_email@keepingitrails.com", password: "pa55w0rd")
      expect(User.exists?(email: "test_email@keepingitrails.com")).to be_truthy
    end
  end

end
