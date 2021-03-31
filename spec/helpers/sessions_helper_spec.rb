# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do

    let(:user) { double(:user, remember_token: "thisisaremembertoken") }

    describe 'sign in' do

        before { sign_in(user) }

        it 'stores user remember token to cookies' do
            expect(cookies.permanent[:remember_token]).to eq("thisisaremembertoken")
        end 

        it 'sets the current user to user' do
            expect(current_user).to eq(user)
        end

    end

     describe 'signed_in?' do

        it 'returns false if no user is signed in' do
            expect(signed_in?).to be false
        end 

        it 'returns true if there is a current user' do
            sign_in(user)
            expect(signed_in?).to be true
        end

    end

    describe 'current_user' do

        it 'assigns a value to current_user, and returns that value' do
            self.current_user = "beans"
            expect(current_user).to eq("beans")
        end 

    end

    describe 'sign_out' do

        before do 
            sign_in(user)
            sign_out
        end

        it 'deletes the remember token' do
            expect(cookies.permanent[:remember_token]).to be nil
        end 

        it 'sets current user to nil' do
            expect(current_user).to be nil
        end 
    
    end
 
end
