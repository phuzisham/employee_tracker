require('spec_helper')

describe(Employee) do
  describe("#division") do
    it("tells which division it belongs to") do
      test_division = Division.create({:description => "division"})
      test_employee = Employee.create({:name => "employee", :division_id => test_division.id, :project_id => nil})
      expect(test_employee.division()).to(eq(test_division))
    end
  end
  describe("#project") do
    it("tells which project it belongs to") do
      test_project = Project.create({:title => "project"})
      test_employee = Employee.create({:name => "employee", :division_id => nil, :project_id => test_project.id})
      expect(test_employee.project()).to(eq(test_project))
    end
  end
end
