class CreateEventCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :event_categories do |t|
      t.string :key
      t.string :name
      t.integer :alert_duration
      t.string :color

      t.timestamps
    end
  end
end
