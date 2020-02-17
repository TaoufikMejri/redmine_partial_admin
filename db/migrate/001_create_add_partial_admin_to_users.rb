class CreateAddPartialAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :partial_admin, :boolean, :default => false
  end
end
