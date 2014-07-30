class ChangeColumnInstructorToInteger < ActiveRecord::Migration
  def change
    change_column :yoga_classes, :instructor, 'integer USING CAST(instructor AS integer)'
  end
end
