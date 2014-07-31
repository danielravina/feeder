require "spec_helper"

describe MoviesController do

  describe "routing" do
    it "routes to #index" do
      get("movies").should route_to("movies#index")
    end

    it "routes to #import" do
      post("movies/import").should route_to("movies#import")
    end

  end
end