# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User', type: :feature do
  scenario 'Un-signed up user always redirected to Index' do
    visit '/'
    visit '/posts'
    expect(current_path).to eql('/')
  end

  scenario 'Redirected to user\'s wall after sign up' do
    visit '/'
    sign_up
    expect(current_path).to eql(`/users/#{User.all.first.id}`)
  end

  scenario 'Redirected to user\'s wall after log in' do
    visit '/'
    log_in
    expect(current_path).to eql(`/#{User.all.first.id}`)
  end
end
