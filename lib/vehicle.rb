class Vehicle
  @@vehicles = []

  define_singleton_method(:all) do
    @@vehicles
  end

end
