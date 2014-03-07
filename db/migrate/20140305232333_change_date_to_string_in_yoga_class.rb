class ChangeDateToStringInYogaClass < ActiveRecord::Migration
  def change
    change_column :yoga_classes, :day, :string
  end
end
