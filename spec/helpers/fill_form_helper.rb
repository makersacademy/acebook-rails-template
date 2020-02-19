# frozen_string_literal: true

require 'rails_helper'

def fill_in_form
  click_on 'New post'
  fill_in 'Message', with: 'Hello, world!'
  click_button 'Submit'
end
