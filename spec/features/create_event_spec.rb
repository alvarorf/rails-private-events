require 'rails_helper'

RSpec.describe 'Create event from logged in user', type: :feature do
  scenario 'Create event' do
    User.create(name: 'example', username: 'example', email: 'example@example.com', password: 'password1234')
    visit login_url
    fill_in 'email', with: 'example@example.com'
    fill_in 'password', with: 'password1234'
    click_button 'Log in'
    visit '/'
    expect(page).to have_content 'example'
    visit new_event_url
    fill_in 'event[title]', with: 'sample event'
    fill_in 'event[date]', with: '2021-02-30'
    fill_in 'event[location]', with: 'somewhere in the multiverse'
    fill_in 'event[description]', with: 'This is a sample event'
    click_button 'Create Event'
  end
end
