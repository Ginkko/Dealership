require('sinatra')
require('sinatra/reloader')
require('./lib/vehicle')
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
  @vehicle_list = Vehicle.all()
  erb(:vehicle_list)
end

get('/dealership_list') do
  erb(:dealership_list)
end

get('/dealership_add') do
  erb(:dealership_add)
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

get('/vehicle_details') do
  @search_id = params.fetch('search_id').to_i()
  @vehicle_list = Vehicle.all()
  @make = @vehicle_list[@search_id].make()
  @model = @vehicle_list[@search_id].model()
  @year = @vehicle_list[@search_id].year().to_s()
  erb(:vehicle_details)
end
