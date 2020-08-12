class Chore < ApplicationRecord
  # belongs_to :household
  validates :name, presence: true, uniqueness: true 
  validates :points, presence: true

  # created members are unique
  has_many :created_members, foreign_key: "chore_id", class_name: "Member"

  has_many :member_chores
	has_many :members, through: :member_chores #, source: :chore
end
