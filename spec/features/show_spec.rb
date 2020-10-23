describe "#show" do 
	it "Shows the content of the post that the user clicks on" do
		sign_up
		write_post
		click_link "Show"
		expect(page).to have_content "Hello, world"
		end
	end