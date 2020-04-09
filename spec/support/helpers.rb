# frozen_string_literal: true

module PostHelper
  def add_post(_text)
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
  end
end
