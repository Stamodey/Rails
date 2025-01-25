class CreateBookings < ActiveRecord::Migration[8.0]
  def change
    create_table :bookings do |t|
      t.datetime :booking_date
      t.references :photographer, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
