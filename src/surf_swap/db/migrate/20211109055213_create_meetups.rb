class CreateMeetups < ActiveRecord::Migration[6.1]
  def change
    create_table :meetups do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true
      t.boolean :completed

      t.timestamps
    end
  end
end
