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

scenario 'with a password that does not match' do
  expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  expect(current_path).to eq('/users/new')
  expect(page).to have_content 'Password and confirmation password do not match'
end

end