class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|

      t.timestamps
      t.integer :customer_id, null: false
      t.string :name, null: false
    end
  end
end
