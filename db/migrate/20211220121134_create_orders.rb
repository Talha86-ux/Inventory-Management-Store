class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :company_name
      t.decimal :sub_total
      t.string :customer_list
      t.integer :invoice_no
      t.date :invoice_date
      t.decimal :tax
      t.references :customer
      t.timestamps
    end
  end
end
