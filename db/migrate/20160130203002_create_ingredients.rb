class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string  'name', null: false, index: true
      t.decimal 'inventory_amount', default: 0.0
      t.decimal 'density', default: 1.000
      t.integer 'pg', default: 100
      t.integer 'vg', default: 0
      t.decimal 'nicotine', default: 0.0
      t.decimal 'average_cost', default: 0.0
      t.timestamps null: false
    end

    reversible do |dir|
      dir.up do
        change_column :notes, :type, :string, index: true, default: 'Note'
      end
      dir.down do
        change_column :notes, :type, :string, index: true
      end
    end
  end
end
