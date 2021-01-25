class AddDefaultValueToEntregadoAttribute < ActiveRecord::Migration[6.1]
  def change
    change_column :adopcions, :entregado, :string, default: "no-entregado"
  end
end
