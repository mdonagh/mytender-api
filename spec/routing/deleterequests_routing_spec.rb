require "rails_helper"

RSpec.describe DeleterequestsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/deleterequests").to route_to("deleterequests#index")
    end

    it "routes to #new" do
      expect(get: "/deleterequests/new").to route_to("deleterequests#new")
    end

    it "routes to #show" do
      expect(get: "/deleterequests/1").to route_to("deleterequests#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/deleterequests/1/edit").to route_to("deleterequests#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/deleterequests").to route_to("deleterequests#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/deleterequests/1").to route_to("deleterequests#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/deleterequests/1").to route_to("deleterequests#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/deleterequests/1").to route_to("deleterequests#destroy", id: "1")
    end
  end
end
