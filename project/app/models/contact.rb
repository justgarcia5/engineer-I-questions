class Contact < ApplicationRecord
  validates :name, :phone, :email, presence: true

end
