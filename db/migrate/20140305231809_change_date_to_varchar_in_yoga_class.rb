class ChangeDateToVarcharInYogaClass < ActiveRecord::Migration
  def change
    change_column :yoga_classes, :day, :varchar
  end
end
