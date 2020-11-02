module PostsMethods
    def find_empty_category
        categories = Category.all
        empty_category = []
        categories.each do |category|
          empty_category << category if category.posts.empty?
        end
        empty_category
    end

    def user_posts
      @posts = User.find(current_user.id).posts.page(params[:page])
    end
  
    def posts_for_admin
      @posts = Post.where('status = ?', 'new_post').page(params[:page])
    end
  
end