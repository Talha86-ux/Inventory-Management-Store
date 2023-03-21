class InventoryStatusJob < ApplicationJob
    queue_as :default

    # def initialize(title, quantity, supplier)
    #     @title = title
    #     @quantity = quantity
    #     @supplier = supplier
    # end
 
    def perform
        puts "Demo of your first background job........"
    end
end