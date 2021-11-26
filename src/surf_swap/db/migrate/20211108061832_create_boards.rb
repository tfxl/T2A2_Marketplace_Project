class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :designer, null: false
      t.integer :length
      t.integer :width
      t.integer :volume
      t.string :condition
      t.string :fins
      t.string :tail
      t.string :attachments
      t.text :description
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
