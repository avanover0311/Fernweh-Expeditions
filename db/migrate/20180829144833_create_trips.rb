class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.string :location
      t.text :description
      t.date :date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
