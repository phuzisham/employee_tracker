require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")
require('./lib/employee')
require('./lib/division')
also_reload('lib/**/*.rb')
require("pg")
require('pry')

get("/") do
  @divisions = Division.all()
  erb(:index)
end

post("/create_division") do
  description = params["description"]
  division = Division.create({:description => description})
  @divisions = Division.all()
  erb(:index)
end
