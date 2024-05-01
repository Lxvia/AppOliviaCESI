class User < ApplicationRecord
    has_many :gossips #through :comment
    belongs_to :city
    has_many :comments
    has_secure_password
    validates :password_confirmation, presence: true
    validates :email, uniqueness: true
    has_many :likes
end
