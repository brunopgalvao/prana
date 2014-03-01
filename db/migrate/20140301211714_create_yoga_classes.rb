class CreateYogaClasses < ActiveRecord::Migration
  def change
    create_table :yoga_classes do |t|
      t.string :name
      t.string :desc
      t.date :day
      t.time :time
      t.string :instructor

      t.timestamps
    end
  end
end
