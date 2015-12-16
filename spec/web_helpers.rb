
def add_link
		visit "/"
		click_link "Add Bookmark"
		fill_in "Name", with: "Breadfish" 
		fill_in "URL", with: "http://www.breadfish.co.uk/"
end