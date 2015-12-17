
def add_link
		visit "/"
		click_link "Add Bookmark"
		fill_in "Name", with: "Breadfish" 
		fill_in "URL", with: "http://www.breadfish.co.uk/"
end

def add_link_and_tag
	visit "/"
	click_link "Add Bookmark"
	fill_in "Name", with: "Breadfish" 
	fill_in "URL", with: "http://www.breadfish.co.uk/"
	fill_in 'tag', with: "Irreverant"
	click_button "Add"
end