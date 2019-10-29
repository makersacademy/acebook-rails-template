require 'rails_helper'

RSpec.describe User, type: :model do
    validates_email_realness_of :email
  pending "add some examples to (or delete) #{__FILE__}"
end
