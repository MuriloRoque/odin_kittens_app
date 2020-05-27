class Kitten < ApplicationRecord
  validates :name, presence: true, length: { maximum: 12 }
  validates :age, numericality: { less_than_or_equal_to: 20, only_integer: true }
  validates :cuteness, numericality: { less_than_or_equal_to: 10, only_integer: true }
  validates :softness, numericality: { less_than_or_equal_to: 10, only_integer: true }
end
