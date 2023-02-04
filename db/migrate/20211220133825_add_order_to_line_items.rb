# frozen_string_literal: true

class AddOrderToLineItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :line_items, :order, foreign_key: true
  end
end
