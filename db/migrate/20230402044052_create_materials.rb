class CreateMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :materials do |t|

      t.timestamps

      t.text :material, null: false
      t.integer :customer_id, null: false
      t.string :material_title, null: false
    end
  end
end
