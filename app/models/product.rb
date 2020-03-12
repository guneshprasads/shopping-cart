class Product < ApplicationRecord

  has_many :product_categories
  has_many :categories, through: :product_categorie
  has_many :variants, class_name: 'ProductVariant'
  belongs_to :categories
end
