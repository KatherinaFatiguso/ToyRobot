require 'rails_helper'

RSpec.describe "movements/index", type: :view do
  before(:each) do
    assign(:movements, [
      Movement.create!(
        :name => "Name"
      ),
      Movement.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of movements" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
