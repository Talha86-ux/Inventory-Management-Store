class Company < ApplicationRecord
  belongs_to :user
  has_many :suppliers
  has_many :customers
end
