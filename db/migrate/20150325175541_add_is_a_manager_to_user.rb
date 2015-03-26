class AddIsAManagerToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_a_manager, :boolean, :default => false
  end
end
