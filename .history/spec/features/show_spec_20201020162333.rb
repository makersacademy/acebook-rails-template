describe "#show" do 
	it "Shows the content of the post that the user clicks on" do
		newpost
		click_button "Show"
		expect(page).to have_content "Hello, world"
		end
	end