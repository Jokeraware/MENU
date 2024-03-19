class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|

      t.integer :people
      t.datetime :date


      t.timestamps
    end
  end
end
