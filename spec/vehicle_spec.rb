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

  describe('#make') do
    it('returns the make of a vehicle') do
      test_vehicle = Vehicle.new('Toyota', 'Prius', 2000)
      expect(test_vehicle.make()).to(eq('Toyota'))
    end
  end

  describe('#model') do
    it('returns the model of a vehicle') do
      test_vehicle = Vehicle.new('Pontiac', 'Vibe', 2003)
      expect(test_vehicle.model).to(eq('Vibe'))
    end
  end

  describe('#year') do
    it('returns the year of a vehicle') do
      test_vehicle = Vehicle.new('Toyota', 'Prius', 2000)
      expect(test_vehicle.year()).to(eq(2000))
    end
  end

end
