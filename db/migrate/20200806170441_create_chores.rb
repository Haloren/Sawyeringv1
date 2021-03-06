class CreateChores < ActiveRecord::Migration[6.0]
  def change
    create_table :chores do |t|
      t.string :name
      t.integer :points
      t.text :description
      t.belongs_to :member, null: false, foreign_key: true
      t.belongs_to :household, null: false, foreign_key: true

      t.timestamps
    end
  end
end
