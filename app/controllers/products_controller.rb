class ProductsController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    @products = @category.products.includes(:variants).order(:title)
  end

  def min
  	@min = Product.where("price<?",50.00).pluck(:title)
  end

  def max
  	@max = Product.where("price>?",50.00).pluck(:title)
  end


end
