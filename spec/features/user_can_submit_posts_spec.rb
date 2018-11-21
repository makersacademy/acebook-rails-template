# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  before do
    signup1
  end

  scenario 'Can submit posts and view them' do
    post_message('Hello, world!')
    expect(page).to have_content('Hello, world!')
  end

  scenario 'Can view posts newest first' do
    Timecop.freeze(time = Time.now) do
      post_message('Hello, world!')
    end
    post_message('Bye, world!')
    expect(page).to have_content("Bye, world! Posted at: #{time.strftime('%Y-%m-%d %k:%M')}\nHello, world!")
  end

  scenario 'Can view posts newest first' do
    Timecop.freeze(time = Time.now) do
      post_message('Hello, world!')
    end
    expect(page).to have_content("Posted at: #{time.strftime('%Y-%m-%d %k:%M')}")
  end
end
