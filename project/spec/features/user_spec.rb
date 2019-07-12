# frozen_string_literal: true
require 'rails_helper'
require 'capybara/rspec'
include RequestHelpers

feature 'User can see a list of contacts' do
  let(:user) { create_logged_in_user }
  scenario 'clicks contact list' do
    visit contacts_path(user)
    click_link "#{user.email}'s Contacts"
    expect(page).to have_content('Contacts')
  end
end
feature 'User can log out' do
  let(:user) { create_logged_in_user }
  scenario 'clicks logout' do
    visit contacts_path(user)
    click_link 'Logout'
    expect(page).to have_content('Welcome to FriendBook!')
  end
end
