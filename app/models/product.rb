# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :supplier, optional: true
  belongs_to :line_item, optional: true

  validates_presence_of :supplied_by, :title, :quantity

  def self.search_products(search)
    if search
      Product.where("LOWER(title) LIKE '%#{search}%'")
    else
      @products = Product.all
    end
  end
end
