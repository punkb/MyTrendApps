class AddBalanceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :banance, :integer
  end
end
