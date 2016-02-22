class CreateEventPositions < ActiveRecord::Migration[5.0]
  def change
    create_table :event_positions do |t|
      t.string :lat
      t.string :lng
      t.belongs_to :event, foreign_key: true

      t.timestamps
    end
  end
end
