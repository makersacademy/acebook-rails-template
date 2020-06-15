# frozen_string_literal: true

require 'rails_helper'

describe 'test cannot access posts' do
  it "Can't access posts/index" do
    visit '/posts/index'

    expect(page).to have_button('Sign Up')
  end
end
