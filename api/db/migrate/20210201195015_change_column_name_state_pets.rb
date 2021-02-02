class ChangeColumnNameStatePets < ActiveRecord::Migration[6.1]
  def change
    rename_column :pets, :state, :adopted
  end
end
