class User < ApplicationRecord
    has_many :posts

    validates :name, presence: {message: "Name can't be blank"}
    validates :email, presence: {message: "Pleas, add you mail"}, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: {message: "The password is more usefull for you than us..."}, length: { minimum: 2}
end