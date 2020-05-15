class CreateForms < ActiveRecord::Migration[6.0]
  def change
    create_table :forms do |t|
      t.references :tag, index: true, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
