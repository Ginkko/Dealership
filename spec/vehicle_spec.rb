require('rspec')
require('vehicle')
require('pry')

describe('Vehicle') do
  before() do
    Vehicle.clear()
  end

  describe('.all') do
    it('returns the contents of vehicle list') do
      expect(Vehicle.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a vehicle to the vehicle list') do
      test_vehicle = Vehicle.new('Toyota', 'Prius', 2000)
      test_vehicle.save()
      expect(Vehicle.all()).to(eq([test_vehicle]))
    end



  end



end
