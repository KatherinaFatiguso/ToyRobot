require 'rails_helper'

RSpec.describe "robot_movements/show", type: :view do
  before(:each) do
    @robot_movement = assign(:robot_movement, RobotMovement.create!(
      :robot => nil,
      :movement => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
