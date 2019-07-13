class Contact < ApplicationRecord
  validates :name, :phone, :email, presence: true
  validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "xxx-xxx-xxxx format required" }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }


  def self.search(params = {})
    return find_name(params[:search]) if params[:search].present?

    all
  end

  scope :find_name, ->(search) { where("name LIKE :search", search: "%#{search}%") }

  belongs_to :user

end
