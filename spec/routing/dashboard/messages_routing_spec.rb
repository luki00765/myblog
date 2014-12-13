require "rails_helper"

RSpec.describe Dashboard::MessagesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/dashboard/messages").to route_to("dashboard/messages#index")
    end

    it "routes to #new" do
      expect(:get => "/dashboard/messages/new").to route_to("dashboard/messages#new")
    end

    it "routes to #show" do
      expect(:get => "/dashboard/messages/1").to route_to("dashboard/messages#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/dashboard/messages/1/edit").to route_to("dashboard/messages#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/dashboard/messages").to route_to("dashboard/messages#create")
    end

    it "routes to #update" do
      expect(:put => "/dashboard/messages/1").to route_to("dashboard/messages#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/dashboard/messages/1").to route_to("dashboard/messages#destroy", :id => "1")
    end

  end
end
