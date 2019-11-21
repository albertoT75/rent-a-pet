class RemovePriceFromRents < ActiveRecord::Migration[5.2]
  def change
    remove_column :rents, :price, :decimal
  end
end
