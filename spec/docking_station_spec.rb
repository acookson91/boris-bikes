require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it 'fails if no bikes' do
    expect { subject.release_bike }.to raise_error "no bikes available"
  end

  it 'does not dock bike' do
     subject.dock(Bike.new)
     expect { subject.dock(Bike.new) }.to raise_error "no docks available"
  end

  it 'docks bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it 'releases working bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it { is_expected.to respond_to(:bike) }

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end
end
