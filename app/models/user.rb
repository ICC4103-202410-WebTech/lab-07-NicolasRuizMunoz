class User < ApplicationRecord
    has_many :posts

    validates :name, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true, length: { mininum: 6 }
end