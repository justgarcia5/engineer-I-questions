class Contact < ApplicationRecord
  # has_one :name

  validates :name, :phone, :email, presence: true
  validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "xxx-xxx-xxxx format required" }

end
