class CreateUserGroups < ActiveRecord::Migration
  def self.up
    create_table :user_groups do |t|
      t.string  :name
      t.boolean :based_on_cost_price, :default => false, :nil => false
      t.decimal :percent, :default => 0.0, :nil => false
    end
    change_table :users do |t|
      t.integer :user_group_id
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :user_group_id
    end
    drop_table :user_groups
  end
end
