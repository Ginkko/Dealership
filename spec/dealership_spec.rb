require('rspec')
require('dealership')
require('pry')

describe('Dealership') do

  before() do
    Dealership.clear()
  end

  describe('.all') do
    it('returns the contents of an empty dealership list') do
      expect(Dealership.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a dealership to the dealership list') do
      test_dealership = Dealership.new('Reputable Dealer')
      test_dealership.save()
      expect(Dealership.all()).to(eq([test_dealership]))
    end
  end

  describe('.find') do
    it('returns a dealership given its id number') do
      test_dealership = Dealership.new('Bobs Deal-O-Rama')
      test_dealership.save()
      expect(Dealership.find(test_dealership.id())).to(eq(test_dealership))
    end
  end

end
