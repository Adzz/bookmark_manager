
# As a time-pressed user
# So that I can save a website
# I would like to add the site's address and title to my bookmark manager

feature "creating links" do
	scenario "Adding a name and url as a bookmark" do
		add_link
		click_button "Add"
		expect(page).to have_content "Breadfish"

	end

end