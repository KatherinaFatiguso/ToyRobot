require "rails_helper"

RSpec.describe RobotMovementsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/robot_movements").to route_to("robot_movements#index")
    end

    it "routes to #new" do
      expect(:get => "/robot_movements/new").to route_to("robot_movements#new")
    end

    it "routes to #show" do
      expect(:get => "/robot_movements/1").to route_to("robot_movements#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/robot_movements/1/edit").to route_to("robot_movements#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/robot_movements").to route_to("robot_movements#create")
    end

    it "routes to #update" do
      expect(:put => "/robot_movements/1").to route_to("robot_movements#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/robot_movements/1").to route_to("robot_movements#destroy", :id => "1")
    end

  end
end
