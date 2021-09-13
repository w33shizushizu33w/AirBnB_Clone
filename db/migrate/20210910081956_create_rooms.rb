class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :listing_name
      t.text :summery
      t.string :home_type
      t.string :room_type
      t.integer :accommodate
      t.integer :bedroom
      t.integer :bathroom
      t.float :price
      t.boolean :tv
      t.boolean :kitchen
      t.boolean :internet
      t.boolean :heating
      t.boolean :air_conditioning
      t.boolean :is_active

      t.timestamps
    end
  end
end
