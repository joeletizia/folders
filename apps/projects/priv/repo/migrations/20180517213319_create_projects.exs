defmodule Projects.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string
      add :root_folder_id, :integer
    end
  end
end
