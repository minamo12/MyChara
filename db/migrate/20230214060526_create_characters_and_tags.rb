class CreateCharactersAndTags < ActiveRecord::Migration[6.1]
  def change
    create_table :characters_and_tags do |t|

      t.timestamps
      t.integer :character_id, null: false
      t.integer :tag_id, null: false
    end
  end
end
