require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")
require('./lib/employee')
require('./lib/division')
require('./lib/project')
also_reload('lib/**/*.rb')
require("pg")
require('pry')

get("/") do
  @divisions = Division.all()
  @projects = Project.all()
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
  Employee.create({:name => name, :division_id => division_id, :project_id => nil})
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

post("/create_project") do
  title = params["title"]
  Project.create({:title => title})
  redirect "/"
end

get("/project/:id") do
  @project = Project.find(params["id"])
  erb(:project)
end

post("/project/:id") do
  @project = Project.find(params["id"])
  project_id = @project.id
  name = params['name']
  Employee.where(name: name).update({:project_id => project_id})
  erb(:project)
end

patch("/project/:id") do
  @project = Project.find(params["id"])
  title = params["title"]
  @project.update({:title => title})
  erb(:project)
end

delete("/project/:id") do
  @project = Project.find(params["id"])
  @project.delete
  redirect "/"
end
