require 'rails_helper'
require 'capybara/rspec'
include RequestHelpers

feature 'User creates a new contact' do
  let(:user) { create_logged_in_user }
  scenario 'clicks Add Contact link' do
    @contact = create(:contact, user: user)
    visit new_contact_path(@contact)
    click_button("Submit")
    expect(page).to have_content('Contacts')
  end
  scenario 'with attributes for contact' do
    visit new_contact_path(user)
    fill_in 'Name', with: 'Test'
    fill_in 'Phone', with: '222-333-3333'
    fill_in 'Email', with: 'email1@email.com'
    click_button 'Submit'
    expect(page).to have_content('Test')
    expect(page).to have_content('email1@email.com')
    expect(page).to have_content('222-333-3333')
  end
  scenario 'change contact name, phone, email' do

    @contact = create(:contact, user: user)
    visit edit_contact_path(@contact)
    fill_in 'Name', with: 'TestB'
    fill_in 'Phone', with: '333-333-3333'
    fill_in 'Email', with: 'testb@testb.com'
    click_button 'Submit'
    expect(page).to have_content('TestB')
    expect(page).to_not have_content('TestA')
  end
  scenario 'can not edit contact without name, email & phone' do
    @contact = create(:contact, user: user)
    visit edit_contact_path(@contact)
    fill_in 'Name', with: ''
    fill_in 'Email', with: ''
    fill_in 'Phone', with: ''
    click_button 'Submit'
    expect(page).to have_content("Phone can't be blank")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Phone xxx-xxx-xxxx format required")
  end
  scenario "delete contact from list view" do
    @contact = create(:contact, user: user)
    visit contacts_path(@contact)
    expect { click_link '', :id => "delete-contact-#{@contact.id}" }.to change(Contact, :count).by(-1)
    expect(page).to_not have_content("test2@test2.com")
  end
end
