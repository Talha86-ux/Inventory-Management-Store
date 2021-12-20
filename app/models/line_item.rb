class LineItem < ApplicationRecord
  has_one :product
  belongs_to :order, optional: true
end
