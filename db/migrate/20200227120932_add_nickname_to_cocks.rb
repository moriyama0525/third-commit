class AddNicknameToCocks < ActiveRecord::Migration[5.0]
  def change
    add_column :cocks, :nickname, :string
  end
end
