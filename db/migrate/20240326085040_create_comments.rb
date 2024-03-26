class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :restaurant, null: false, foreign_key: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
