class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.text :description
      t.string :breed
      t.numeric :age
      t.references :user, foreign_key: true
      t.string :photo

      t.timestamps
    end
  end
end
