describe "#edit" do 
	it "let's a user edit a post" do 
		newpost
		click_link "Edit"
		find("edit").set("Testing Article")
		click_button "Submit"
		expect(page).not_to have_content("Hello, world")
		expect(page).to have_content("Testing Article")
	end 
	end 