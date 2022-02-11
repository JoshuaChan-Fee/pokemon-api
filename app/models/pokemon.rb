class Pokemon < ApplicationRecord
  # validation
  validates :number, presence: true, numericality: { only_integer: true }
  validates :name, presence: true
  validates :total, presence: true, numericality: { only_integer: true }
  validates :hp, presence: true, numericality: { only_integer: true }
  validates :attack, presence: true, numericality: { only_integer: true }
  validates :defense, presence: true, numericality: { only_integer: true }
  validates :specialAttack, presence: true, numericality: { only_integer: true }
  validates :specialDefense, presence: true, numericality: { only_integer: true }
  validates :speed, presence: true, numericality: { only_integer: true }
  validates :generation, presence: true
end
