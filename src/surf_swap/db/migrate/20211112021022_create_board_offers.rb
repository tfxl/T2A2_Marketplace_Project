class CreateBoardOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :board_offers do |t|
      t.references :board, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
