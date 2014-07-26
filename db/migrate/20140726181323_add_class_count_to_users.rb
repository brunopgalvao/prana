class AddClassCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :class_count, :integer
  end
end
