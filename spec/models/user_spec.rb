require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    subject = User.create(first_name: 'Dave', last_name: 'Whoever', email: 'dave@123.com', password: 123)
  end
  
  it 'Creates a new User object' do
    expect(subject).to be_a User
  end

  context 'For testing validation helpers' do
    it 'Does not add data with a non-unique email address' do
      user = User.create(first_name: 'Mathilde', last_name: 'Giggly', email: 'dave@123.com', password: 123)
      expect(user.id).to eq nil
    end

    it 'Does not add data wefuses entries without a first name' do
      user = User.create(first_name: '', last_name: 'Giggle', email: 'anotheremail@email.com', password: 123)
      expect(user.id).to eq nil
    end
  end

end
