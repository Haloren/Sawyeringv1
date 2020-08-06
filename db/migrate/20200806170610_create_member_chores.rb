class CreateMemberChores < ActiveRecord::Migration[6.0]
  def change
    create_table :member_chores do |t|
      t.belongs_to :members, null: false, foreign_key: true
      t.belongs_to :chores, null: false, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
