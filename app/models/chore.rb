class Chore < ApplicationRecord
  # belongs_to :household
  belongs_to :members

  has_many :member_chores
	has_many :members, through: :member_chores
end
