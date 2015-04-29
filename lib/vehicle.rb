class Vehicle
  @@vehicles = []
  @@id_counter = 0

  define_method(:initialize) do |make, model, year|
    @make = make
    @model = model
    @year = year
    @id = @@id_counter
    @@id_counter += 1
  end


  define_singleton_method(:all) do
    @@vehicles
  end


  define_singleton_method(:clear) do
    @@vehicles = []
    @@id_counter = 0
  end

  define_singleton_method(:find) do |find_id|
    found_vehicle = nil
    @@vehicles.each() do |vehicle|
      if vehicle.id().eql?(find_id.to_i())
        found_vehicle = vehicle
      end
    end
    found_vehicle
  end

  define_method(:save) do
    @@vehicles.push(self)
  end

  define_method(:make) do
    @make
  end

  def model
    @model
  end

  def year
    @year
  end

  def id
    @id
  end

end
