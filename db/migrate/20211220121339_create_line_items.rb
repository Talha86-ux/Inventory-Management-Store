# frozen_string_literal: true

class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.decimal :price, null: false
      t.integer :quantity, null: false
      t.decimal :total_price
      t.string :product
      t.references :products
      t.timestamps
    end
  end
end
