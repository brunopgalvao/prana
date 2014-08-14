class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.string :package
      t.decimal :price

      t.timestamps
    end
  end
end
