class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.references :user, null: false, foreign_key: true
      t.date :meetup_date
      t.time :meetup_time
      t.references :address, null: false, foreign_key: true
      t.string :header
      t.string :status
      t.text :comment

      t.timestamps
    end
  end
end
