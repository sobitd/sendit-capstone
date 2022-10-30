class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :email_address, presence: true, uniqueness: true
  validates :phone_number, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true, length: { minimum: 8 }
end
