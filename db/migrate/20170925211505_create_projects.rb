class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table(:projects) do |x|
      x.column(:title, :string)
      x.column(:done, :boolean)

      x.timestamps()
    end
    add_column(:employees, :project_id, :integer)
  end
end
