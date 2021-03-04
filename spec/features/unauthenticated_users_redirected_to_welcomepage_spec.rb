# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Redirected', type: :feature do
  scenario 'if unauthenticated user tries to access posts, they are redirected' do
    visit('/posts')
    expect(current_path).to eq('/')
  end
end
