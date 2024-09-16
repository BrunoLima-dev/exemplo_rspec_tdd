class Product < ApplicationRecord
  belongs_to :category
  validates :description, :prince, :category, presence: true

  def full_description
    "#{self.description} - #{self.prince}"
    # Produto 1 - 10.0
  end
end
