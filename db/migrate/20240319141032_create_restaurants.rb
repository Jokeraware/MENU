class CreateRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants do |t|
      t.string :restaurant_name
      t.belongs_to :city, foreign_key: true, index: true
      t.belongs_to :admin, index: true
      t.timestamps
    end
  end
end
