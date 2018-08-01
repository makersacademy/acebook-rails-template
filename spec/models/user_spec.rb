require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to be }

  describe '#authenticate' do

    it 'returns true if given correct password' do
      user = User.create(first_name: "Elishka", last_name: "Flint", email: "elishka@keepingitrails.com", password: "pa55w0rd")
      expect(user.authenticate("pa55w0rd")).to be_truthy
    end

    it 'returns false if given incorrect password' do
      user = User.create(first_name: "Elishka", last_name: "Flint", email: "elishka@keepingitrails.com", password: "pa55w0rd")
      expect(user.authenticate("wrong_pa55w0rd")).to be_falsey
    end

  end

end
