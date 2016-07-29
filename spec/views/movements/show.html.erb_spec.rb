require 'rails_helper'

RSpec.describe "movements/show", type: :view do
  before(:each) do
    @movement = assign(:movement, Movement.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
