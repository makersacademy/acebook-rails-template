describe "Deleting a post" do
  let!(:user) {User.create(email: 'test@example.com', password: 'testpass')}
  let!(:post) {Post.create(message: 'Test message', user_id: user.id, wall_id: user.id)}

  before do
    visit('/users/sign_in')
    fill_in 'Email' ,with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  it "displays a delete button with every post" do
      visit("/#{user.id}")
      expect(page).to have_button("Delete")
  end

  

end
