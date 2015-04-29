require('rspec')
require('vehicle')
require('pry')

describe('Vehicle') do

  describe('.all') do
    it('returns the contents of vehicle list') do
      expect(Vehicle.all()).to(eq([]))
    end
  end

end
