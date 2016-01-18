class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text "text", null: false
      t.string "type", index: true
      t.timestamps null: false
    end
  end
end
