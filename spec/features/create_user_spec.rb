require 'rails_helper'

RSpec.describe 'New user', type: :feature do
  scenario 'Create new user' do
    visit signup_url

    fill_in 'user[name]', with: 'example'
    fill_in 'user[username]', with: 'example'
    fill_in 'user[email]', with: 'example@example.com'
    fill_in 'user[password]', with: 'password1234'
    click_button 'Sign up'
    expect(page).to have_content 'example'
  end

  scenario 'It should throw an error if we try to create a new user without an email' do
    visit signup_url

    fill_in 'user[name]', with: 'example'
    fill_in 'user[username]', with: 'example'
    fill_in 'user[username]', with: 'example@example.com'
    click_button 'Sign up'
    expect(page).to have_content 'The following errors'
  end
end
