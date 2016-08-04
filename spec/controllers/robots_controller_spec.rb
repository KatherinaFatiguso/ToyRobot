require 'rails_helper'

RSpec.describe RobotsController, type: :controller do
  context "place" do
    subject{ Robot.new }

    describe 'GET #place' do
      it "should be moved to the specifid location" do
        get :place,  :id => subject.id, :x => 0, :y => 0, :f => 'NORTH'
        expect(subject.x).to eq(0)
      end
    end
  end
end
