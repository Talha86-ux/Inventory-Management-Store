class Supplier < ApplicationRecord
  belongs_to :company, optional: true
  has_many :products, dependent: :destroy
end
