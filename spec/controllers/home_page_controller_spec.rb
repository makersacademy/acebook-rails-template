require 'rails_helper'

RSpec.describe HomePageController, type: :controller do
  describe '#home' do
   it 'empty method' do
     expect(subject.home).to eq nil
   end
  end

  describe '#afterlogin' do
   it 'should return something...' do
     expect(subject.home).to eq nil
   end
  end
end
