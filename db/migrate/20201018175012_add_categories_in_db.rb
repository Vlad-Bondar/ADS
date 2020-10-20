class AddCategoriesInDb < ActiveRecord::Migration[6.0]
  def change
    Category.create(category: "sport")
    Category.create(category: "car")
    Category.create(category: "home")
    Category.create(category: "money")
  end
end
