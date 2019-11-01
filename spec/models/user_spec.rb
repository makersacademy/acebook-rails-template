# frozen_string_literal: true

require 'rails_helper'
require 'validates_email_format_of/rspec_matcher'

RSpec.describe User, type: :model do
  it { should validate_email_format_of(:email).with_message('is not looking good') }
end
