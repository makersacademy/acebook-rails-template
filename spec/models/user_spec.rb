require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'username' do
      it 'invalid if contains numbers' do
        user = User.new(name: "Bill Ben7", email: "bill2@bill.com", password: "billbill")
        expect(user.valid?).to be false
      end
    end
end
