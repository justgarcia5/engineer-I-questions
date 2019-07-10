# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'contact' do
    let(:contact) { build(:contact) }
    context 'when all attributes supplied' do
      it 'contact' do
        expect(contact).to be_valid
      end
    end
    context 'when attributes are missing' do
      let(:contact) { build(:contact, name: nil, email: nil, phone: nil) }
      it 'cannot be created without name, email, phone' do
        expect(contact).to_not be_valid
      end
    end
  end
end