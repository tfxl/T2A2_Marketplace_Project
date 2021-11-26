class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :website_main
      t.string :website_menu
      t.string :suburb
      t.string :street_name
      t.string :street_number
      t.references :postcode, null: false, foreign_key: true

      t.timestamps
    end
  end
end
