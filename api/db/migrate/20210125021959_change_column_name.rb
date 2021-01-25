class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :pets, :type, :type_of_pet
  end
end
