class CreateFlavors < ActiveRecord::Migration
  def change
    add_column :ingredients, :type, :string, index: true, default: 'Ingredient'
  end
end
