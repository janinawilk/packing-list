class CreateTripItems < ActiveRecord::Migration[8.1]
  def change
    create_table :trip_items do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.boolean :is_packed, default: false, null: false
      t.boolean :added_manually, default: false, null: false

      t.timestamps
    end
  end
end
