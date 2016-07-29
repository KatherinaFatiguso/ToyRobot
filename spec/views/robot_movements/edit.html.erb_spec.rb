require 'rails_helper'

RSpec.describe "robot_movements/edit", type: :view do
  before(:each) do
    @robot_movement = assign(:robot_movement, RobotMovement.create!(
      :robot => nil,
      :movement => nil
    ))
  end

  it "renders the edit robot_movement form" do
    render

    assert_select "form[action=?][method=?]", robot_movement_path(@robot_movement), "post" do

      assert_select "input#robot_movement_robot_id[name=?]", "robot_movement[robot_id]"

      assert_select "input#robot_movement_movement_id[name=?]", "robot_movement[movement_id]"
    end
  end
end
