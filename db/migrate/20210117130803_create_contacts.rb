class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :type
      t.string :title
      t.string :content
      t.string :tel
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
