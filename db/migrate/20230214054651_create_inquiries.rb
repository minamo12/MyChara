class CreateInquiries < ActiveRecord::Migration[6.1]
  def change
    create_table :inquiries do |t|

      t.timestamps
      t.integer :customer_id, null: false
      t.text :inquiry, null: false
      t.text :answer, null: false
      t.integer :content, null: false
      t.boolean :solve, null: false, default: false
    end
  end
end
