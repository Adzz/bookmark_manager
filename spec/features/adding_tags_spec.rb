# As a time-pressed user
# So that I can organise my many links into different categories for ease of search
# I would like to tag links in my bookmark manager

feature "Ading Tags to bookmarks" do

	scenario "When I add a bookmark, I would like to be able to add a tag" do

		add_link
		fill_in 'tag', with: "Irreverant"
		click_button "Add"
		within 'ul#links' do
			expect(page).to have_content "Irreverant"
		end
	end



end

