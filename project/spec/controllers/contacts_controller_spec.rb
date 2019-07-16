require 'rails_helper'
include ControllerHelpers

describe ContactsController, type: :controller do
  login_user
  let(:contact) { create(:contact, user: @user) }
  let(:valid_item_attributes) {
    { name: "test", phone: "555-555-5555", email: "test@test.com"}
  }

  it "creates contact" do
    expect{
      post :create, params: { contact: valid_item_attributes }
    }.to change(Contact, :count).by(1)
    expect(response).to redirect_to contacts_path
  end

  it "finds a searched contact by name" do
    contact = create(:contact, name: "Test", phone: "555-555-5555", email: "test2@test2.com", user: @user)
    @result = Contact.search(search: "Test")
    expect(@result).to eq([contact])
  end
end
