require_relative 'clearance_helpers.rb'


def writes_a_message
  sign_up_with('bob@email.com', 'bob1', 'password1')
  visit "/rooms/show"
  fill_in "write_message", with: "Hello, world!\n"
end