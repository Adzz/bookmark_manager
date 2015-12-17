# As a time-pressed user
# So that I can organise my links into different categories for ease of search
# I would like to add tags to the links in my bookmark manager

feature "Adding multiple tags to a link" do

	scenario "Multiple tags on each bookmark" do
		add_link
		fill_in 'tag', with: "Irreverant, Funny"
		click_button "Add"
		link = Link.first
  	expect(link.tags.map(&:tag)).to include('Irreverant',"Funny")

	end

end