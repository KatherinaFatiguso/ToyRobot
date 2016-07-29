class CreateRobotMovements < ActiveRecord::Migration
  def change
    create_table :robot_movements do |t|
      t.references :robot, index: true, foreign_key: true
      t.references :movement, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
