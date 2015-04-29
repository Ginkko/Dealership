require('sinatra')
require('sinatra/reloader')
require('./lib/vehicle')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/vehicle_list') do
  @vehicle_list = Vehicle.all()
  erb(:vehicle_list)
end

get('/vehicle_add') do
  erb(:vehicle_add)
end
