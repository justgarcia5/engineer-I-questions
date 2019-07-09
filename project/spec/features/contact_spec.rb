require 'rails_helper'
require 'capybara/rspec'

feature 'User creates a new contact' do
  scenario 'clicks Add Contact link' do
    visit new_contact_path
    click_button("Submit")
    expect(page).to have_content('Contacts')
  end
  scenario 'with attributes for contact' do
    visit new_contact_path
    fill_in 'Name', with: 'Test'
    fill_in 'Phone', with: '222-333-3333'
    fill_in 'Email', with: 'email1@email.com'
    click_button 'Submit'
    expect(page).to have_content('Test')
    expect(page).to have_content('email1@email.com')
    expect(page).to have_content('222-333-3333')
  end
  # scenario 'change contact name, phone, email' do
  #   visit edit_contact_path(@contact)
  #   fill_in 'Name', with: 'TestB'
  #   fill_in 'Phone', with: '333-333-3333'
  #   fill_in 'Email', with: 'testb@testb.com'
  #   click_button 'Submit'
  #   expect(page).to have_content('TestB')
  #   expect(page).to_not have_content('TestA')
  # end
end
