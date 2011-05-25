class UsergroupVariant < ActiveRecord::Migration
  def self.up
	      create_table :user_groups_variants do |t|
		      t.integer :user_group_id
		      t.integer :variant_id
		      t.decimal :price
		      t.timestamps
	    end
  end

  def self.down
	  drop_table :user_groups_variants
  end
end
