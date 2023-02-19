class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|

      t.timestamps
      t.integer :inquiry_id, null: false
      t.integer :customer_id, null: false
      t.text :answer, null: false

    end
  end
end
