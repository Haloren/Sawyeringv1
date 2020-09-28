class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :password_digest
      t.integer :points
      t.boolean :admin
      t.belongs_to :household, null: false, foreign_key: true

      t.timestamps
    end
  end
end
