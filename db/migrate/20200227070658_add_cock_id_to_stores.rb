class AddCockIdToStores < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :cock_id, :integer, null: false
  end
end
