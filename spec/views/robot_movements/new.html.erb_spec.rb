require 'rails_helper'

RSpec.describe "robot_movements/new", type: :view do
  before(:each) do
    assign(:robot_movement, RobotMovement.new(
      :robot => nil,
      :movement => nil
    ))
  end

  it "renders new robot_movement form" do
    render

    assert_select "form[action=?][method=?]", robot_movements_path, "post" do

      assert_select "input#robot_movement_robot_id[name=?]", "robot_movement[robot_id]"

      assert_select "input#robot_movement_movement_id[name=?]", "robot_movement[movement_id]"
    end
  end
end
