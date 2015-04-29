class Dealership

  @@dealerships = []
  @@id_counter = 0

   define_method(:initialize) |name|
     @name = name
     @id = @@id_counter
     @@id_counter += 1
   end

  define_singleton_method(:all) do
    @@dealerships
  end

  define_singleton_method(:clear) do
    @@dealerships = []
  end

  def save
    @@dealerships.push(self)
  end


end
