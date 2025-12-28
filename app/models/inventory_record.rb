class InventoryRecord < ApplicationRecord
  self.abstract_class = true

  def self.connection
    @connection ||= establish_connection(:inventory_store).connection
  end
end