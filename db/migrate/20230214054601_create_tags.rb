class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|

      t.timestamps
      t.integer :customer_id, null: false
      t.string :tag_name, null: false
    end
  end
end
