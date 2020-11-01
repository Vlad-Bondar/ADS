module PostsMethods
    def find_empty_category
        categories = Category.all
        empty_category = []
        categories.each do |category|
          empty_category << category if category.posts.empty?
        end
        empty_category
    end
end