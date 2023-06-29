class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods
  validates :name, presence: true, length: { maximum: 250 }
  validates :preparation_time, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :cooking_time, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true

  def total_price
    total = 0
    recipe_foods.each do |recipe_food|
      total += recipe_food.price * recipe_food.quantity
    end
    total
  end
end
