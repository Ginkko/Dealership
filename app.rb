require('sinatra')
require('sinatra/reloader')
require('./lib/vehicle')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/vehicle_list') do
  erb(:vehicle_list)
end
