# RSpec.feature "block edit", type: :feature do

#   before do
#     sign_up("email@example.com", "pass12", "pass12")
#     click_link "New post"
#   end

#   scenario "it should block edit if expired time over 10mins" do
#     fill_in "Message", with: "Hello again, world!"
#     click_button "Submit"


#     Timecop.freeze(Time.now + 610)
#     click_link "Edit"
#     p Time.now

#     expect(page).to have_content "Timeline"
#   end
# end