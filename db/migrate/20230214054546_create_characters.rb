class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|

      t.timestamps
      t.integer :customer_id, null: false
      t.string :name, null: false
      t.text :explanation, null: false
    end
  end
end
