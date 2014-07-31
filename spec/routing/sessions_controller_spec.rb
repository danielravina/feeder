require "spec_helper"

describe SessionsController do

  describe "routing" do
    it "routes to #create" do
      post("sessions").should route_to("sessions#create")
    end

    it "routes to #new" do
      get("sessions/new").should route_to("sessions#new")
    end

    it "routes to #logout" do
      get("logout").should route_to("sessions#destroy")
    end

    it "routes to #login" do
      post("login").should route_to("sessions#create")
    end

    it "routes to #login" do
      get("login").should route_to("sessions#new")
    end
  end
end