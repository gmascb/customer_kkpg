class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.references :form, index: true, foreign_key: true

      t.timestamps
    end
  end
end
