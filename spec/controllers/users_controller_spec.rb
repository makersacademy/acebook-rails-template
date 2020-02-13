require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe '#create' do
    it 'creates new user and saves to database' do
      get :new
      allow(controller).to receive(:params).and_return(ActionController::Parameters.new(users: { email: 'test@email.com', password: 'password' }))
      expect_any_instance_of(User).to receive(:save!)
      allow(controller).to receive(:redirect_to).and_return(nil)
      subject.create
    end
    it 'creates new user in the database' do
      get :new
      allow(controller).to receive(:params).and_return(ActionController::Parameters.new(users: { email: 'test@email.com', password: 'password' }))
      allow(controller).to receive(:redirect_to).and_return(nil)
      subject.create
      expect(session[:user].id).not_to eq(nil)
      expect(session[:user].email).to eq('test@email.com')
      expect(session[:user].password).not_to eq(nil)
    end
  end
end
