class CreateClaims < ActiveRecord::Migration[5.2]
  def change
    create_table :claims do |t|
      t.string :patient
      t.string :policy_number
      t.date :hospital_stay
      t.string :account_number
      t.string :receipt_img
      t.string :destination
      t.references :user, foreign_key: true
      t.string :illness
      t.date :discharge

      t.timestamps
    end
  end
end
