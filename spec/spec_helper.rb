require("rspec")
require("pg")
require("sinatra/activerecord")
require("employee")
require("division")

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  config.after(:each) do
    Employee.all().each() do |task|
      task.destroy()
    end
  end
end

RSpec.configure do |config|
  config.after(:each) do
    Division.all().each() do |task|
      task.destroy()
    end
  end
end
