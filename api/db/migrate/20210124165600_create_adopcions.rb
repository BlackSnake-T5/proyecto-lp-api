class CreateAdopcions < ActiveRecord::Migration[6.1]
  def change
    create_table :adopcions do |t|
      t.references :adopter, null: true
      t.references :donante, null: false
      t.references :pets, null: false, foreign_key: true
      t.boolean :entregado
      


      t.timestamps
    end

    add_foreign_key "adopcions", "users", column:"adopter_id"
    add_foreign_key "adopcions", "users", column:"donante_id"

  end
end
