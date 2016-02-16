class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :lat
      t.string :lon
      t.text :description
      t.belongs_to :event_category, foreign_key: true

      t.timestamps
    end
  end
end
