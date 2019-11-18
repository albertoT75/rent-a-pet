class CreateRents < ActiveRecord::Migration[5.2]
  def change
    create_table :rents do |t|
      t.references :user, foreign_key: true
      t.references :pet, foreign_key: true
      t.date :start_period
      t.date :end_period
      t.numeric :price

      t.timestamps
    end
  end
end
