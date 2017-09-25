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
  redirect "/"
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

patch("/division/:id") do
  @division = Division.find(params["id"])
  description = params["description"]
  @division.update({:description => description})
  erb(:division)
end

delete("/division/:id") do
  @division = Division.find(params["id"])
  @division.delete
  redirect "/"
end

get("/employee/:id") do
  @employee = Employee.find(params["id"])
  erb(:employee)
end

patch("/employee/:id") do
  @employee = Employee.find(params["id"])
  name = params["name"]
  @employee.update({:name => name})
  erb(:employee)
end

delete("/employee/:id") do
  @employee = Employee.find(params["id"])
  @employee.delete
  redirect "/"
end
