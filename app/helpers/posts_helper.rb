module PostsHelper
    def find_published_categories
        posts = Post.where('status = ?', 'published')
        published_category = []
        posts.each do |post| 
            published_category << post.category
        end
        published_category.uniq
    end

    def find_published_users
        posts = Post.where('status = ?', 'published')
        published_users = []
        posts.each do |post| 
            published_users << post.user
        end
        published_users.uniq
    end
end
