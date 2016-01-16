class CreateRecipeCategories < ActiveRecord::Migration
  def change
    create_table :recipe_categories do |t|
      t.string     'name',             index: true
      t.string     'description'
      t.timestamps null: false
    end
  end
end
