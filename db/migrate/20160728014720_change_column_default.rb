class ChangeColumnDefault < ActiveRecord::Migration
  def change
    change_column :robots, :x, :integer, default: 0
    change_column :robots, :y, :integer, default: 0
    change_column :robots, :f, :string, default: "EAST"
  end
end
