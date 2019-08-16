require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

#
# Instead, your tests around password handling should be more black box,
# and assert that you can log in with the known password, and not login with
# any others (including code-breaking cases such as nils, empty strings,
#   super-long passwords and a string which matches the hashed password).


# 
# login with password: "123456789"
#
# can't login password: "123456789"
