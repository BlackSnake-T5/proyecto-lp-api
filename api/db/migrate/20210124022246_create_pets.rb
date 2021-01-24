class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :type
      t.string :breed
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end
end
