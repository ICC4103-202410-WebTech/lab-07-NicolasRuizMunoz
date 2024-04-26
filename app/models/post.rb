class Post < ApplicationRecord
  
    has_many :post_tags
    has_many :tags, through: :post_tags

    belongs_to :user
    
    belongs_to :parent_post, class_name: "Post", optional: true
    has_many :child_posts, class_name: "Post", foreign_key: "parent_post_id"

    validates :title, presence: {message: "how are you gonna make a post without a title!"}
    validates :content, presence: {message: "Whats the point of a post if you dont add anny content?"}
    validates :user_id, presence: {message: "You need to be logged in to make a post!"}
    validates :answers_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 , message: "You need to have at least 0 answers!"}
    validates :likes_count, numericality: { only_integer: true, greater_than_or_equal_to: 0, message: "You need to have at least 0 likes!"}
    

    before_save :set_time_now_publish_date
    def set_time_now_publish_date
        self.published_at = Time.zone.now
      end

end