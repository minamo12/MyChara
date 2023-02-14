class CreateCharactersAndCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :characters_and_categories do |t|

      t.timestamps
      t.integer :character_id, null: false
      t.integer :category_id, null: false
    end
  end
end
