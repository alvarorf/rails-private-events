require 'rails_helper'

RSpec.describe 'Authenticate user', type: :feature do
  scenario 'Login user' do
    User.create(name: 'example', username: 'example', email: 'example@example.com', password: 'password1234')
    visit login_url
    fill_in 'email', with: 'example@example.com'
    fill_in 'password', with: 'password1234'
    click_button 'Log in'
    visit '/'
    expect(page).to have_content 'example'
  end
end
