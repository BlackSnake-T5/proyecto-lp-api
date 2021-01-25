class AddNameToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :name, :string
  end
end
