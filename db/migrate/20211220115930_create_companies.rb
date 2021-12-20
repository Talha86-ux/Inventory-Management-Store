class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :business_domain
      t.string :assign_manager
      t.references :user
      t.timestamps
    end
  end
end
