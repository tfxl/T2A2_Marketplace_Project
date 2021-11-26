class CreatePostcodes < ActiveRecord::Migration[6.1]
  def change
    create_table :postcodes do |t|
      t.integer :number
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
