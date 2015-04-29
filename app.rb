require('sinatra')
require('sinatra/reloader')
require('./lib/vehicle')
require('./lib/dealership')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/vehicle_add') do
  erb(:vehicle_add)
end

get('/vehicle_search') do
  erb(:vehicle_search)
end

get('/vehicle_list') do

  id = params.fetch('dealership_search_id').to_i()
  @vehicle_list = Dealership.find(id).cars()
  erb(:vehicle_list)
end

get('/dealership_list') do
  @dealership_list = Dealership.all()
  erb(:dealership_list)
end

get('/dealership_add') do
  erb(:dealership_add)
end

get('/vehicle_details') do
  @search_id = params.fetch('search_id').to_i()
  @vehicle_list = Vehicle.all()
  @make = @vehicle_list[@search_id].make()
  @model = @vehicle_list[@search_id].model()
  @year = @vehicle_list[@search_id].year().to_s()
  erb(:vehicle_details)
end

get('/dealership_find_id') do
  dealership_id = params.fetch('dealer_search_id').to_i()
  @dealership = Dealership.find(dealership_id)
  erb(:vehicle_list)
end

get('/dealership_search') do
  erb(:dealership_search)
end

post('/save_vehicle') do
  make = params.fetch('make')
  model = params.fetch('model')
  year = params.fetch('year').to_i()
  vehicle = Vehicle.new(make, model, year)
  vehicle.save()
  @vehicle_list = Vehicle.all()
  erb(:vehicle_list)
end

post('/save_dealership') do
  name = params.fetch('name')
  dealership = Dealership.new(name)
  dealership.save()
  @dealership_list = Dealership.all()
  erb(:dealership_list)
end

post('/save_dealership_vehicle') do
  make = params.fetch('make')
  model = params.fetch('model')
  year = params.fetch('year').to_i()
  vehicle = Vehicle.new(make, model, year)
  @dealership = Dealership.find(params.fetch('dealership_id').to_i())
  @dealership.add_vehicle(vehicle)
  erb(:vehicle_list)
end
