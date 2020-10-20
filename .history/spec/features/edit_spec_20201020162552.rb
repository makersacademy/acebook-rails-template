describe "#edit" do 
	it "let's a user edit a post" do 
		newpost
		clink_link "Edit"
		fill_in :message, with "I am editing this"
		expect(page).not_to have_content("Hello, wolrd")
		expect(page).to have_content("I am editing this")
	end 

	end 