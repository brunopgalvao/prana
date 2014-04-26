class AddDefaultValueToStudentAttribute < ActiveRecord::Migration
  def change
    change_column :users, :student, :boolean, :default => true
  end
end
