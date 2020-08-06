class Member < ApplicationRecord
    has_many :chores
	has_many :member_chores
	has_many :chores, through :member_chores
	has_many :categories, through :chores
end
