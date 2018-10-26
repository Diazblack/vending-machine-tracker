class Snack < ApplicationRecord
  validates_presence_of :name
  validates :price, presence: true, numericality: true

  belongs_to :machine

  def self.average_price
    Snack.average(:price).round(2) 
 end
end
