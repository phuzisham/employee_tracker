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
  Division.create({:description => description})
  @divisions = Division.all()
  erb(:index)
end

get("/division/:id") do
  @division = Division.find(params["id"])
  erb(:division)
end

post("/division/:id") do
  @division = Division.find(params["id"])
  division_id = @division.id
  name = params['name']
  Employee.create({:name => name, :division_id => division_id})
  erb(:division)
end
