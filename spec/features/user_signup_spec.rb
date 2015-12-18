feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Alice')
    expect(User.first.email).to eq('alice@example.com')
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


end