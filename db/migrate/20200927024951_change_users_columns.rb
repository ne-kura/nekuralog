class ChangeUsersColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :hosts, :password_digest, :string
    remove_column :hosts, :password, :string
  end
end
