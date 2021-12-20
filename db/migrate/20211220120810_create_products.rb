class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description
      t.integer :quantity
      t.string :supplied_by
      t.references :supplier
      t.timestamps
    end
  end
end
