
# As a time-pressed user
# So that I can save a website
# I would like to add the site's address and title to my bookmark manager

feature "creating links" do
	scenario "Adding a name and url as a bookmark" do
		visit "/"
		click_link "Add Bookmark"
		fill_in "Name", with: "Breadfish" 
		fill_in "URL", with: "http://www.breadfish.co.uk/"
		click_button "Add"
		expect(page).to have_content "Breadfish"

	end

end