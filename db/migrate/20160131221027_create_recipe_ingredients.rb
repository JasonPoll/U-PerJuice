class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.decimal 'percentage', default: 0.0
      t.timestamps null: false
    end
  end
end
