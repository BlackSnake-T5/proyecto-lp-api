class AddStateToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :state, :boolean, default: 1
  end
end
