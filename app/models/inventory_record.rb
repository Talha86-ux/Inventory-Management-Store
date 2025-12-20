class InventoryRecord < ApplicationRecord
  self.abstract_class = true

  establish_connection :inventory_store
end