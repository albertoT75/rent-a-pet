class AddAddressColumnToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :address, :string
  end
end
