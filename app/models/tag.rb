class Tag < ApplicationRecord
    has_many :post_tags
    has_many :posts, through: :post_tags

    validates :name, presence: {message: "Is a tag usefull without a name?"}
    validates :name, uniqueness: {message: "This tag already exists"}
end