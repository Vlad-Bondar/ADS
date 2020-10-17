class Post < ApplicationRecord
    validates :header,:body , presence: :true
    belongs_to :user

    enum status: {
        draft:     "draft",
        new_post:  "new",
        rejected:  "rejected",
        approved:  "approved",
        published: "published",
        archived:  "archived"
    }


    def self.publishing_posts
        posts = Post.where('status = ?', "approved")
        posts.each do |post| 
            post.published!
        end
    end

    def self.archiving_posts
        posts = Post.where('status = ?', "published")
        posts.each do |post| 
            Time.now - post.created_at >= 3.days ? post.archived!
        end
    end 

        
    
end