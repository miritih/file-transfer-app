require "rails_helper"

RSpec.describe MediaFilesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/media_files").to route_to("media_files#index")
    end

    it "routes to #new" do
      expect(:get => "/media_files/new").to route_to("media_files#new")
    end

    it "routes to #create" do
      expect(:post => "/media_files").to route_to("media_files#create")
    end

    it "routes to #destroy" do
      expect(:delete => "/media_files/1").to route_to("media_files#destroy", :id => "1")
    end
  end
end
