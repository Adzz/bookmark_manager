# As a time-pressed user
# So that I can quickly find links on a particular topic
# I would like to filter links by tag

feature "Filtering bookmarks by tags" do 

	scenario "User can press a button to view bookmarks labbeled with certain tag" do

		add_link_and_tag
		fill_in 'filter', with: "Irreverant"
		click_button "Filter"
		expect(page).to have_content "Breadfish"
	end
	
end


























