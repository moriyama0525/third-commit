class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.references :food, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
