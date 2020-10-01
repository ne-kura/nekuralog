class AddhostToid < ActiveRecord::Migration[6.0]
  def change
    add_column :hosts, :login_id, :string
  end
end
