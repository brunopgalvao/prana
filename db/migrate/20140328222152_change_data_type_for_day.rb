class ChangeDataTypeForDay < ActiveRecord::Migration
  def change
    remove_column :yoga_classes, :day
    add_column :yoga_classes, :day, :integer
  end
end
