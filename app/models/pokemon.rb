class Pokemon < ApplicationRecord
  validates :title, uniqueness: true
end
