class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :postcode, :integer
  end
end
