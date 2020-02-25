class AddCockIdToFoods < ActiveRecord::Migration[5.0]
  def change
    add_column :foods, :cock_id, :integer
  end
end
