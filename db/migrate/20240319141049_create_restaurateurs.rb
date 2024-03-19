class CreateRestaurateurs < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurateurs do |t|

      t.string :first_name
      t.string :last_name
      t.integer :city_name
      t.string :email
      t.string :restaurant_name

      t.timestamps
    end
  end
end

  # siret integer