require 'rails_helper'

RSpec.describe Devise::Mailer do
  it 'sends confirmation email to correct email with custom text' do
    user = FactoryBot.create(:user)

    confirmation_email = Devise.mailer.deliveries.last

    expect(user.email).to eq confirmation_email.to[0]
    expect(confirmation_email.body.to_s).to have_content 'Your magical experience begins.'

  end
end
