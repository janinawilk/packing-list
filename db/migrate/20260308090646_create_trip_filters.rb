class CreateTripFilters < ActiveRecord::Migration[8.1]
  def change
    create_table :trip_filters do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
