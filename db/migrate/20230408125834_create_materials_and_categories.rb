class CreateMaterialsAndCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :materials_and_categories do |t|

      t.timestamps

      t.integer :material_id, null: false
      t.integer :category_id, null: false
    end
  end
end
