class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.text :comment
      t.string :status, default: "being considered"
      t.references :listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end


