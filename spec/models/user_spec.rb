require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'username' do
      it 'is invalid if not unique' do
        User.create(name: "Bill", email: "bill@bill.com", password: "billbill")
        user = User.new(name: "Bill", email: "bill2@bill.com", password: "billbill")
        expect(user.valid?).to be false
      end
      fit 'invalid if contains numbers' do
        user = User.new(name: "Bill Ben7", email: "bill2@bill.com", password: "billbill")
        expect(user.valid?).to be false
      end
    end
end
