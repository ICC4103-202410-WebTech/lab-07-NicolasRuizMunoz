class Post_tags < ApplicationRecord
    belongs_to :post
    belongs_to :tag
end