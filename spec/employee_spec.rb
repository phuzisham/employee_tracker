describe("#division") do
  it("tells which division it belongs to") do
    test_division = Division.create({:description => "division"})
    test_employee = Employee.create({:name => "employee", :division_id => test_division.id})
    expect(test_employee.division()).to(eq(test_division))
  end
end
