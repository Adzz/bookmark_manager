
feature "User Stories" do
# As a time-pressed user
# So that I can quickly go to web sites I regularly visit
# I would like to see a list of links on the homepage

feature "So I can quickly navigate to website, I would like to see my favs on the homepage" do 

	scenario "View list of favourites" do
		Link.create(url: 'http://www.isitchristmas.com', name: "Is it Christmas")
		visit "/"
		expect(page.status_code).to eq 200
		expect(page).to have_content "Is it Christmas"
	end
end


end