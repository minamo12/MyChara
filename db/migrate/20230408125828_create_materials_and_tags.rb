class CreateMaterialsAndTags < ActiveRecord::Migration[6.1]
  def change
    create_table :materials_and_tags do |t|

      t.timestamps

      t.integer :material_id, null: false
      t.integer :tag_id, null: false
    end
  end
end
