class CreateUserBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :user_bookings do |t|

      t.belongs_to :user
      t.belongs_to :booking

      t.timestamps
    end
  end
end
