class CreateDivisions < ActiveRecord::Migration[5.1]
  def change
    create_table(:divisions) do |d|
      d.column(:description, :string)

      d.timestamps()
    end
  end
end
