class AddReservationLimitToRestaurants < ActiveRecord::Migration[7.1]
  def change
    add_column :restaurants, :reservation_limit, :integer
  end
end
