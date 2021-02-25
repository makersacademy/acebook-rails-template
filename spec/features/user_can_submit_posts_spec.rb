# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    create_a_new_post_and_see_it_on_the_feed("Hello, world!")
  end

  scenario 'Posts are shown in order of creation' do
    create_a_new_post_and_see_it_on_the_feed("Hello, world!")
    create_a_new_post_and_see_it_on_the_feed("I am first")
    expect(page.all('p')[0]).to have_content 'I am first'
  end
end
