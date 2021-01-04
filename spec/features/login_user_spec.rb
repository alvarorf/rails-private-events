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

  scenario 'It should fail to authenticate the user if the user does not exist' do
    User.create(name: 'example', username: 'example', email: 'example@example.com', password: 'password1234')
    visit login_url
    fill_in 'email', with: 'example2@example.com'
    fill_in 'password', with: 'password1234'
    click_button 'Log in'
    expect(page).to have_content 'incorrect'
  end

  scenario 'It should not show another username different from the current user' do
    User.create(name: 'example', username: 'example', email: 'example@example.com', password: 'password1234')
    visit login_url
    fill_in 'email', with: 'example@example.com'
    fill_in 'password', with: 'password1234'
    click_button 'Log in'
    expect(page).to_not have_content 'example2'
  end
end
