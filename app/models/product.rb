# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :supplier, optional: true
  belongs_to :line_item, optional: true

  validates_presence_of :supplied_by
end
