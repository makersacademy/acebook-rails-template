# frozen_string_literal: true

require 'rails_helper'

describe 'can edit a post' do
  it 'create new post then immediately edit it' do
    new_post
    click_link 'Destroy'
    expect(page).not_to have_content('Hello, world!')
  end
end
