class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.string :contract_name
      t.string :policy_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
