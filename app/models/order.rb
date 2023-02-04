# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer, optional: true
  has_many :line_items, dependent: :destroy

  accepts_nested_attributes_for :line_items, allow_destroy: true, reject_if: :all_blank
end
