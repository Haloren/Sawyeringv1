class Chore < ApplicationRecord
  belongs_to :members
  belongs_to :categories
end
