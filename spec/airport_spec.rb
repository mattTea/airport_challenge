require "airport"
require "plane"

describe Airport do
  before(:each) do
    @airport = Airport.new
    @plane = Plane.new
  end

  it "responds to 'land_plane' method" do
    expect(@airport).to respond_to(:land_plane)
  end

  it "responds to 'launch_plane' method" do
    expect(@airport).to respond_to(:launch_plane)
  end

  it "adds plane to airport on landing" do
    expect(@airport.land_plane(@plane)).to eq [@plane]
  end

  it "adds second plane airport on landing" do
    @airport.land_plane(@plane)
    plane2 = Plane.new
    expect(@airport.land_plane(plane2)).to eq [@plane, plane2]
  end
  
  it "returns an empty airport on launching its only plane" do
    @airport.land_plane(@plane)
    expect(@airport.launch_plane(@plane)).to eq []
  end

  it "removes specific plane from airport on launching plane" do
    plane2 = Plane.new
    @airport.land_plane(@plane)
    @airport.land_plane(plane2)
    expect(@airport.launch_plane(@plane)).to eq [plane2]
  end
end