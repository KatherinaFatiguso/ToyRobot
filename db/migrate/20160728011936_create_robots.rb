class CreateRobots < ActiveRecord::Migration
  def change
    create_table :robots do |t|
      t.integer :x
      t.integer :y
      t.string :f

      t.timestamps null: false
    end
  end
end
