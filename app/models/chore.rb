class Chore < ApplicationRecord
  belongs_to :members
  belongs_to :categories

  has_many :member_chores
	has_many :members, through :member_chores
end
