# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'friendslist', type: :feature do
  it 'Can view friends page' do
    log_in_eman
    click_link 'Emanuele'
<<<<<<< HEAD
    expect(page).to have_content('Profile Page')
=======
    expect(page).to have_content("About")
>>>>>>> master
  end
end
