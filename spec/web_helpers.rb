
def add_link
		visit "/bookmarks"
		click_link "Add Bookmark"
		fill_in "Name", with: "Breadfish" 
		fill_in "URL", with: "http://www.breadfish.co.uk/"
end

def add_link_and_tag
	visit "/bookmarks"
	click_link "Add Bookmark"
	fill_in "Name", with: "Breadfish" 
	fill_in "URL", with: "http://www.breadfish.co.uk/"
	fill_in 'tag', with: "Irreverant"
	click_button "Add"
end


def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'alice@example.com'
  fill_in :password, with: 'oranges!'
  fill_in :passwordconf, with: 'oranges!'
  fill_in :name, with: 'Alice'
  click_button "Sign up"
end