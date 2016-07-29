require 'rails_helper'

RSpec.describe "robot_movements/index", type: :view do
  before(:each) do
    assign(:robot_movements, [
      RobotMovement.create!(
        :robot => nil,
        :movement => nil
      ),
      RobotMovement.create!(
        :robot => nil,
        :movement => nil
      )
    ])
  end

  it "renders a list of robot_movements" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
