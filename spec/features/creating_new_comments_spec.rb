
require 'rails_helper'
require 'helpers/create_user'
require 'helpers/user_log_in'
require 'helpers/create_post'

feature 'Creating Comments' do
    scenario 'can comment on post' do
        create_user
        user_log_in
        create_post
        fill_in 'Comment', with: 'This is a needlessly offensive comment, perfect!'
        click_button 'Submit'
        expect(page).to have_content('This is a needlessly offensive comment, perfect!')
    end
end
