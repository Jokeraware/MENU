class AddReferencesToAdmin < ActiveRecord::Migration[7.1]
  def change
    add_column :admins, :first_name, :string
    add_column :admins, :last_name, :string
    add_column :admins, :city_id, :integer
    add_foreign_key :admins, :cities, column: :city_id
  end
end
