class CreateBoardListings < ActiveRecord::Migration[6.1]
  def change
    create_table :board_listings do |t|
      t.references :board, null: false, foreign_key: true
      t.references :listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
