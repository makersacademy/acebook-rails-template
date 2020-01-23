# RSpec.feature "Friend List", type: :feature doß
  
#   let(:userA) { create(:user, :email => "testa@example.com", :password => "pass12A", :id => 1) }
#   let(:userB) { create(:user, :email => "testb@example.com", :password => "pass12B", :id => 2) }
#   let(:userC) { create(:user, :email => "testc@example.com", :password => "pass12C", :id => 3) }

#   let friendship

#   scenario "Third party can see others' friendship without editing options" do
#     userA
#     userB
#     userC
#     sign_in("testa@example.com", "pass12A")
#     click_link "Friend List"
#     within(".non-friends") do
#       expect(page).to have_content("testb@example.com")
#       expect(page).to have_content("testc@example.com")
#     end

#     find('a', id: "add_friend_user2").click


#     expect(page).to have_content("testb@example.com")

#     expect(page).to have_selector(:css, 'a[href="actual link"]')

#     find('a', id: "add_friend_user2").click

#     expect(page).to have_link("Remove")
#     click_link "Sign out"
    
#     sign_in("testc@example.com", "pass12C")
#     visit "/users/1"
#     click_link "Friend List"
#     expect(page).to have_content("testb@example.com")
#     expect(page).not_to have_link("Add friend")
#     expect(page).not_to have_link("Remove")
#   end
# end
