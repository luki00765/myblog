require "rails_helper"

RSpec.describe Dashboard::CommentsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/dashboard/comments").to route_to("dashboard/comments#index")
    end

    it "routes to #new" do
      expect(:get => "/dashboard/comments/new").to route_to("dashboard/comments#new")
    end

    it "routes to #show" do
      expect(:get => "/dashboard/comments/1").to route_to("dashboard/comments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/dashboard/comments/1/edit").to route_to("dashboard/comments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/dashboard/comments").to route_to("dashboard/comments#create")
    end

    it "routes to #update" do
      expect(:put => "/dashboard/comments/1").to route_to("dashboard/comments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/dashboard/comments/1").to route_to("dashboard/comments#destroy", :id => "1")
    end

  end
end
