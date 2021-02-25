require 'rails_helper'

feature 'User is redirected' do
    scenario 'user redirected to the home page' do
        visit'/posts'
        expect(page).to have_current_path('/')
    end
end