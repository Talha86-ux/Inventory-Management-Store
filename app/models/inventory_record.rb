class InventoryRecord < ApplicationRecord
  self.abstract_class = true

  # Only register the external DB connection if the URL is present in ENV.
  # Do NOT call `connection` here — calling `connection` forces an immediate
  # connection attempt at load time which breaks `rails console` when the
  # external DB is not available. `establish_connection` registers the
  # connection spec and will connect lazily when the app actually queries it.
  if ENV['INVENTORY_STORE_DATABASE_URL'].present?
    begin
      establish_connection :inventory_store
    rescue => e
      Rails.logger.warn "InventoryRecord: failed to establish_connection(:inventory_store) - #{e.message}"
    end
  end
end