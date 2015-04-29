class Dealership

  @@dealerships = []
  @@id_counter = 0

   define_method(:initialize) do |name|
     @name = name
     @id = @@id_counter
     @@id_counter += 1
     @cars = []
   end

  define_singleton_method(:all) do
    @@dealerships
  end

  define_singleton_method(:clear) do
    @@dealerships = []
  end

  define_singleton_method(:find) do |find_id|
    @@dealerships.each() do |dealership|
      if(dealership.id() == find_id)
        return dealership
      end
    end
    return nil
  end

  define_method(:add_vehicle) do |vehicle|
    @cars.push(vehicle)
  end

  def save
    @@dealerships.push(self)
  end

  def name
    @name
  end

  def id
    @id
  end

  def cars
    @cars
  end

end
