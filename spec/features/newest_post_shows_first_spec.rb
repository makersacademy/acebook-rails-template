require_relative '../helpers/web_helpers'
require 'rails_helper'

RSpec.feature "Post order", type: :feature do
  scenario "Posts should be shown in a reverse chronological order" do
    sign_up('Harry', 'Mumford', 'harry_mumford@hotmail.co.uk', 'password')
    new_post('First post')

    sleep(1)

    new_post('Second post')
    ('Second post').should appear_before('First post')
  end
end
