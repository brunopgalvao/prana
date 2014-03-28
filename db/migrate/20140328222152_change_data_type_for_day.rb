class ChangeDataTypeForDay < ActiveRecord::Migration
  def change
    change_column :yoga_classes, :day, :integer
  end
end
