class AddPriceToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :price, :decimal
  end
end
